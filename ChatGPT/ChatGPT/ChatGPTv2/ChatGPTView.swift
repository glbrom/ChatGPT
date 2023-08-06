//
//  ChatGPTView.swift
//  ChatGPT
//
//  Created by Macbook on 30.07.2023.
//

import SwiftUI
import Combine

struct ChatGPTView: View {
    @State var chatMessages: [ChatMessage] = []
//    @State var messageTextClass: String = "Згенеруй завдання по Array Swift iOS"
//    @State var messageTextStruct: String = "Згенеруй завдання по Dictionary Swift iOS"
    @State var messageText: String = ""
    
    @State var cancellable = Set<AnyCancellable>()
    let openAIService = OpenAIApi()
    
    var body: some View {
        ZStack {
           
           
            
            ZStack {
                
//                            Color.black
                           
            
                VStack {
                   
                    ScrollView {
                        LazyVStack {
                            ForEach(chatMessages, id: \.id) { message in
                                messageView(message: message)
                            }
                        }
                    }
                    
                    HStack {
                        
                        TextField("Enter message to ChatGPT", text: $messageText) {
                           
                        }
                        .padding()
                        .background(.gray.opacity(0.1))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        Button {
                            sendMessage_()
                        } label: {
                            Text("Send")
                        }
        //                Button {
        //                    sendMessage()
        //                } label: {
        //                    Text("Array")
        //                        .foregroundColor(.white)
        //                        .frame(width: 100, height: 30)
        //                        .padding()
        //                        .background(Color.blue)
        //                        .cornerRadius(8)
        //                }
        //                .padding(.trailing, 40)
        //                Button {
        //                    sendMessage_()
        //                } label: {
        //                    Text("Dictionary")
        //                        .foregroundColor(.white)
        //                        .frame(width: 100, height: 30)
        //                        .padding()
        //                        .background(Color.blue)
        //                        .cornerRadius(8)
        //                }
                    }
                    
//                    .padding(.bottom, 10)
                }
//                .padding(.top, 30)
                .padding()
        //        .background(GradientView())
    //            .background(
    //                LinearGradient(gradient: Gradient(colors: [Color("lightBlue"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom)
    //        )
                .background(Color.black)
            }
            MatrixView()
                .ignoresSafeArea()
        }
//        .ignoresSafeArea()
    }
    
    func messageView(message: ChatMessage) -> some View {
        HStack {
            if message.sender == .user {
                Spacer()
            }
            Text(message.content)
                .foregroundColor(message.sender == .user ? .white : .white)
                .padding()
                .background(message.sender == .user ? .blue : .black.opacity(0.3))
                .cornerRadius(12)
            if message.sender == .gpt {
                Spacer()
            }
        }
    }
//
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
            chatMessages.append(messageGPT)
        }
        .store(in: &cancellable)
        messageText = ""
    }
//    func  sendMessage() {
//        let messageUser = ChatMessage(id: UUID().uuidString, content: messageTextClass, sender: .user, date: Date())
//        chatMessages.append(messageUser)
//        openAIService.sendMessage(message: messageTextClass).sink { completion in
//            // Error
//        } receiveValue: { response in
//            guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else { return }
//            let messageGPT = ChatMessage(id: response.id,
//                                         content: response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) ?? "",
//                                         sender: .gpt, date: Date())
//            chatMessages.append(messageGPT)
//        }
//        .store(in: &cancellable)
//        messageText = ""
//    }
}

struct ChatGPTView_Previews: PreviewProvider {
    static var previews: some View {
        ChatGPTView()
    }
}
