//
//  ViewModel.swift
//  ChatGPTWatch Watch App
//
//  Created by Macbook on 09.08.2023.
//

import Foundation
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    
    @Published var isInteracting = false
    @Published var chatMessages: [ChatMessage] = []
    @Published var messageText: String = ""
    @Published var cancellable = Set<AnyCancellable>()
//     var showsIndicators: Bool = false
  
    let openAIService = OpenAINetworkService()
    typealias StringCompletionOne = (String) -> Void
    
    @MainActor
    func clearMessages() {
        chatMessages.removeAll()
        withAnimation { [weak self] in
            self?.chatMessages = []
        }
    }
    
    @MainActor
    func messageView(message: ChatMessage) -> some View {
        HStack {
            if message.sender == .user {
                Spacer()
            }
            Text(message.content)
                .foregroundColor(message.sender == .user ? .white : .white)
                .padding()
                .background(message.sender == .user ? Color("MatrixColor").opacity(0.2) : .black.opacity(0.5))
//                .background(message.sender == .user ? Color("AccentColor").opacity(0.9) : .black.opacity(0.5))
                .cornerRadius(12)
            if message.sender == .gpt {
                Spacer()
            }
        }
    }
    
    @MainActor
    func  sendMessage_() {
        let messageUser = ChatMessage(id: UUID().uuidString, content: messageText, sender: .user, date: Date())
        chatMessages.append(messageUser)
        openAIService.sendMessage(message: messageText).sink { completion in
            // Error
        } receiveValue: { response in
            guard (response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\"")))) != nil else { return }
            let messageGPT = ChatMessage(id: response.id,
                                         content: response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) ?? "",
                                         sender: .gpt, date: Date())
            self.chatMessages.append(messageGPT)
        }
        .store(in: &cancellable)
        messageText = ""
    }
    
    #if os(watchOS)
    func presentInputControllerOne(withSuggestions suggestions: [String], completion: @escaping StringCompletionOne) {
        WKExtension.shared()
            .visibleInterfaceController?
            .presentTextInputController(withSuggestions: suggestions,
                                        allowedInputMode: .plain) { result in
                
                guard let result = result as? [String], let firstElement = result.first else {
                    completion("")
                    return
                }
                
                completion(firstElement)
            }
    }
    #endif
    
    
}
