//
//  ChatView.swift
//  ChatGPT
//
//  Created by Macbook on 30.07.2023.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        // Matrix Effect
//        ZStack {
            //            Color.black
            //            MatrixView()
            
            VStack {
                ScrollView {
                    
                    ForEach(viewModel.messages.filter({ $0.role != .system }), id: \.id) { message in
                        messageView(message: message)
                    }
                }
                
                HStack {
                    
                    TextField("Send message...", text: $viewModel.currentInput)
                    
                    Button {
                        viewModel.sendMessage()
                    } label: {
                        Text("Send")
                    }
                }
            }
            .padding()
            
            
// Matrix Effect
//        }
//        .ignoresSafeArea()
    }
    
        func messageView(message: Message) -> some View {
            HStack{
                if message.role == .user { Spacer() }
                Text(message.content)
                    .padding()
                    .background(message.role == .user ? Color.green : Color.gray.opacity(0.2))
                    .cornerRadius(15)
                if message.role == .assistant { Spacer() }
            }
            }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
