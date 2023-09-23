//
//  ChatGPTMacView.swift
//  ChatGPTMac
//
//  Created by Macbook on 08.08.2023.
//

import SwiftUI
//import Combine

struct ChatMacView: View {
   
//    @State var chatMessages: [ChatMessage] = []
//    @State var messageText: String = ""
//    @State var cancellable = Set<AnyCancellable>()
////     var showsIndicators: Bool = false
//    @Binding var isPresented: Bool
    
    @StateObject var vm = ViewModel()
    
//    let openAIService = OpenAINetworkService()
    
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
//                        ZStack(alignment: .trailing) {
                        TextField("Send a message", text: $vm.messageText, axis: .vertical)
//                            .autocorrectionDisabled()
//                            #if os(iOS) || os(macOS)
                            .textFieldStyle(.roundedBorder)
                            
//                            #endif
                                .padding()
                                .foregroundColor(.white).opacity(1)
//                                .background {
//                                    TransparentBlurView(removeAllFilters: true)
//                                        .blur(radius: 9, opaque: true)
//                                        .background(Color("MatrixColor").opacity(0.45))
//
////                                        .background(.black.opacity(0.2))
//                                }
//                                .frame(width: 20)
                                .background(Color("AccentColor"))
//                                .clipShape(Circle())
                               
//                                .accentColor(.white)
                                .cornerRadius(12)
//                                
                                .colorScheme(.dark)
                                
                        Button {
                            vm.clearMessages()
                            
                        } label: {
                            Image(systemName: "trash.fill")
                            //                          .disabled(vm.isInteracting || vm.chatMessages.isEmpty)
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
//                                    .frame(width: 8, height: 8)
                                    .foregroundColor(Color.white)
                                    .padding()
                                    .background(Color("AccentColor"))
                                    .clipShape(Circle())
                                    .rotationEffect(.degrees(15))

                            }
//                        #if os(macOS)
                            .buttonStyle(.borderless)
//                            .frame(width: 20, height: 20)
//                            .foregroundColor(.red)
                            .keyboardShortcut(.defaultAction)
//                        #endif
                        //                            .padding(.leading, 20)
//                            .padding(.trailing, 8)

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
        
    
//    func messageView(message: ChatMessage) -> some View {
//        HStack {
//            if message.sender == .user {
//                Spacer()
//            }
//            Text(message.content)
//                .foregroundColor(message.sender == .user ? .white : .white)
//                .padding()
//                .background(message.sender == .user ? .white.opacity(0.2) : .black.opacity(0.5))
//                .cornerRadius(12)
//            if message.sender == .gpt {
//                Spacer()
//            }
//        }
//    }

//    func  sendMessage_() {
//        let messageUser = ChatMessage(id: UUID().uuidString, content: messageText, sender: .user, date: Date())
//        chatMessages.append(messageUser)
//        openAIService.sendMessage(message: messageText).sink { completion in
//            // Error
//        } receiveValue: { response in
//            guard (response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\"")))) != nil else { return }
//            let messageGPT = ChatMessage(id: response.id,
//                                         content: response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) ?? "",
//                                         sender: .gpt, date: Date())
//            chatMessages.append(messageGPT)
//        }
//        .store(in: &cancellable)
//        messageText = ""
//    }
}

#Preview {
    //    ChatMacView(isPresented: .constant(true))
ChatMacView()
}
