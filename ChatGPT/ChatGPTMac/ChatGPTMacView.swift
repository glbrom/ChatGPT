//
//  ChatGPTMacView.swift
//  ChatGPTMac
//
//  Created by Macbook on 08.08.2023.
//

import SwiftUI

struct ChatMacView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(vm.chatMessages, id: \.id) { message in
                        vm.messageView(message: message)
                    }
                }
            }
            .padding(.top, 16)
            
            HStack(spacing: 8) {
                TextField("Send a message", text: $vm.messageText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .foregroundColor(.white).opacity(1)
                    .background(Color("AccentColor"))
                    .cornerRadius(12)
                    .colorScheme(.dark)
                
                Button {
                    vm.clearMessages()
                    
                } label: {
                    Image(systemName: "trash.fill")
                        .frame(width: 8, height: 8)
                        .font(.system(size: 16))
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color("AccentColor"))
                        .clipShape(Circle())
                }
                .buttonStyle(.borderless)
                
                Button {
                    vm.sendMessage_()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .frame(width: 8, height: 8)
                        .font(.system(size: 16))
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color("AccentColor"))
                        .clipShape(Circle())
                        .rotationEffect(.degrees(15))
                    
                }
                .buttonStyle(.borderless)
                .keyboardShortcut(.defaultAction)
            }
        }
        .overlay {
            if vm.chatMessages.isEmpty {
                Text("Enter message and pressed button send")
                    .font(.system(size: 12))
            }
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("BackgroundColor").opacity(0.55), Color.black]), startPoint: .top, endPoint: .bottom)
        )
        .frame(width: 400, height: 420)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .background {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(.white.opacity(0.4), lineWidth: 2)
        }
    }
}

#Preview {
    ChatMacView()
}
