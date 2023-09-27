//
//  ChatWatchView.swift
//  ChatGPTWatch Watch App
//
//  Created by Macbook on 09.08.2023.
//


import SwiftUI


struct ChatWatchView: View {
    
//    @Binding var isPresented: Bool
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ZStack {
            Image("darkSurface1")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 1, opaque: true)
            
            VStack {
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVStack {
                        ForEach(vm.chatMessages, id: \.id) { message in
                            vm.messageView(message: message)
                        }
                    }
                })
                .padding(.top, 6)
                .padding(.bottom, -6)
                HStack {
                    
                    Button {
                        vm.clearMessages()
                    } label: {
                        Image(systemName: "trash.fill")
//                            .disabled(vm.isInteracting || vm.chatMessages.isEmpty)
                            .frame(width: 40, height: 16)
                            .font(.system(size: 18))
                            .foregroundColor(Color("MatrixColor"))
                            .padding()
                            .background(.black)
                            .clipShape( RoundedRectangle(cornerRadius: 18, style: .continuous))
                    }
                    .padding(.trailing, 12)
                    .tint(.clear)
                    
                    Spacer()
                    
                    Button {
                        vm.presentInputControllerOne(withSuggestions: []) { result in
                            
                            Task { @MainActor in
                                guard !result.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
                                vm.messageText = result.trimmingCharacters(in: .whitespacesAndNewlines)
                                vm.sendMessage_()
                            }
                        }
                    }
                   
                    
                label: {
                    Image(systemName: "paperplane.fill")
                        .frame(width: 40, height: 16)
                        .font(.system(size: 18))
                        .foregroundColor(Color("MatrixColor"))
                        .rotationEffect(.degrees(15))
                        .padding()
                        .background(.black)
                        .clipShape( RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
                .padding(.leading, 12)
                                                            .tint(.clear)
                    
                }
//                .padding(.leading, 2)
//                .padding(.trailing, 2)
                .padding(.bottom, -8)
//                .padding(.top, 2)
                //                                        .background(.clear)
                //                                        .padding()
            }
            .padding()
            .overlay {
                if vm.chatMessages.isEmpty {
                    Text("Tap send to ChatGPT")
                        .font(.system(size: 12))
                    
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8),  Color("MatrixColor").opacity(0.9)]), startPoint: .top, endPoint: .bottom)
            )
            
            .frame(width: WKInterfaceDevice.current().screenBounds.width - 15, height: WKInterfaceDevice.current().screenBounds.height - 50)
            
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .background {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(.white.opacity(0.4), lineWidth: 2)
            }
            .shadow(color: .gray.opacity(0.5), radius: 10)
        }
    }
}

#Preview {
//    ChatWatchView(isPresented: .constant(true))
    ChatWatchView()
}
