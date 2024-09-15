//
//  ChatView.swift
//  ChatGPT
//
//  Created by Macbook on 06.08.2023.
//

import SwiftUI
//import Combine

struct ChatView: View {
    @Binding var isPresented: Bool
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ZStack {
            
            Image("darkSurface1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 2, opaque: true)
            Image("ImageIcon")
                .resizable()
                .frame(width: 350, height: 350)
                .scaledToFill()
                .blur(radius: 5, opaque: true)
            
            VStack {
                // button dismiss
                HStack {
                    Spacer()
                    Button(action: {
                        vm.clearMessages()
                        
                    }) {
                        Image(systemName: "trash.fill")
                            .frame(width: 8, height: 8)
                            .font(.system(size: 14))
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        self.isPresented.toggle()
                    }) {
                        Image(systemName: "xmark")
                            .frame(width: 8, height: 8)
                            .font(.system(size: 14))
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                    
                }
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack {
                        ForEach(vm.chatMessages, id: \.id) { message in
                            vm.messageView(message: message)
                        }
                    }
                })
                .padding(.top, 8)
                
                HStack {
                    TextField("Send a message", text: $vm.messageText, axis: .vertical)
                    
                        .padding()
                        .background {
                            TransparentBlurView(removeAllFilters: true)
                                .blur(radius: 9, opaque: true)
                                .background(Color("MatrixColor").opacity(0.45))
                        }
                        .background(.black.opacity(0.7))
                        .foregroundColor(.white)
                        .accentColor(.white)
                        .cornerRadius(12)
                        .colorScheme(.dark)
                    
                    Button {
                        vm.sendMessage_()
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 16))
                            .frame(width: 12, height: 12)
                            .foregroundColor(Color("MatrixColor"))
                            .rotationEffect(.degrees(15))
                            .padding()
                            .background(.black)
                            .clipShape(Circle())
                    }
#if os(macOS)
                    .buttonStyle(.borderless)
                    .foregroundColor(.accentColor)
                    .keyboardShortcut(.defaultAction)
#endif
                    .padding(.trailing, -4)
                }
            }
            .overlay {
                if vm.chatMessages.isEmpty {
                    Text("Enter message and pressed  button send")
                        .font(.system(size: 16))
                        .foregroundStyle(.black)
                }
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.75),  Color("MatrixColor").opacity(0.8)]), startPoint: .top, endPoint: .bottom)
            )
            
            .background {
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: 70, opaque: true)
                    .background(Color("MatrixColor")).opacity(0.6)
            }
            .frame(width: 370, height: 700)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.white.opacity(0.4), lineWidth: 2)
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)
            
            
            
        }
    }
}

#Preview {
    ChatView(isPresented: .constant(true))
}
