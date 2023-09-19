//
//  ChatView.swift
//  ChatGPT
//
//  Created by Macbook on 06.08.2023.
//

import SwiftUI
//import Combine

struct ChatView: View {
   
//    @State var chatMessages: [ChatMessage] = []
//    @State var messageText: String = ""
//    @State var cancellable = Set<AnyCancellable>()
//     var showsIndicators: Bool = false
    @Binding var isPresented: Bool
    
//    let openAIService = OpenAINetworkService()
    
    @StateObject var vm = ViewModel()
    
    var body: some View {

            ZStack {

                Image("darkSurface1")
                    .resizable()
//                    .frame(width: 400, height: 1000)
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
//       .buttonStyle(.borderless)
//                    Spacer(minLength: 5)
//                    Text("ChatGPT")
////                        .font(.title)
//                        .font(.custom("DIN Condensed", size: 30))
//                        .foregroundColor(Color.black)
//                        .fontWeight(.light)
//                    .padding(.top, 5)
       
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
                           
//                            .opacity(0.8)
//                            .padding(.trailing, 8)
    //                        .offset(x: 160, y: 35)
                        //                            .foregroundColor(.white)
                        //                            .frame(width: 169, height: 42)
                        //                            .background(Color(#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)))
                        //                            .cornerRadius(20)
                        //                            .shadow(color: Color(#colorLiteral(red: 0.9803921569, green: 0.3921568627, blue: 0, alpha: 1)).opacity(0.6), radius: 10, y: 10)

                }
  
//                    .padding(.trailing, -20)
//                    .padding(.top, 8)


                }
//                    Button(action: {
//                        isPresented = false
//                    }) {
//                        Image(systemName: "xmark")
//                            .frame(width: 1, height: 1)
//                            .font(.system(size: 12))
//                            .foregroundColor(Color.red)
//                            .padding()
//                            .background(Color.green)
//                            .clipShape(Circle())
//                            .padding(.trailing, 12)
//
//
//                    }
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVStack {
                            ForEach(vm.chatMessages, id: \.id) { message in
                                vm.messageView(message: message)
                            }
                        }
                    })
                    .padding(.top, 8)
                   
                    
                   
                    HStack {
//                        ZStack(alignment: .trailing) {
                        TextField("Send a message", text: $vm.messageText, axis: .vertical)
                            
                                .padding()
                                .background {
                                    TransparentBlurView(removeAllFilters: true)
                                        .blur(radius: 9, opaque: true)
                                        .background(Color("MatrixColor").opacity(0.45))
                                    
//                                        .background(.black.opacity(0.2))
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
//                                                    .padding(.leading, 20)
                            .padding(.trailing, -4)
                        
//                        }
                 
                        
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
//                    .padding()
                    
                    //                    .padding(.bottom, 10)
                }
                .overlay {
                    if vm.chatMessages.isEmpty {
                        Text("Enter message and pressed  button send")
                            .font(.system(size: 16))
                            .foregroundStyle(.black)
                    }
                }
                //                .padding(.top, 30)
                .padding()
//                        .background(GradientView())
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.75),  Color("MatrixColor").opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                        )
                
                .background {
                                   TransparentBlurView(removeAllFilters: true)
                                       .blur(radius: 70, opaque: true)
                                       .background(Color("MatrixColor")).opacity(0.6)
                               }
//                .background(Color("MatrixColor")).opacity(0.5)
                .frame(width: 370, height: 700)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(.white.opacity(0.4), lineWidth: 2)
                }
                .shadow(color: .gray.opacity(0.5), radius: 10)
        
                
                
            }
         
//            MatrixView()
//                .ignoresSafeArea()
        
           
//    }
       
//        .ignoresSafeArea()
    }
        
    
//    func messageView(message: ChatMessage) -> some View {
//        HStack {
//            if message.sender == .user {
//                Spacer()
//            }
//            Text(message.content)
//                .foregroundColor(message.sender == .user ? .white : .white)
//                .padding()
//                .background(message.sender == .user ? Color("MatrixColor").opacity(0.2) : .black.opacity(0.5))
//                .cornerRadius(12)
//            if message.sender == .gpt {
//                Spacer()
//            }
//        }
//    }
//
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

#Preview {
    ChatView(isPresented: .constant(true))
}
