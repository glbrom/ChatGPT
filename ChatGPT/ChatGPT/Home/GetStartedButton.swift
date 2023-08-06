//
//  GetStartedButton.swift
//  ChatGPT
//
//  Created by Macbook on 30.07.2023.
//

import SwiftUI

struct GetStartedButton: View {
    
    private let githubURL = URL(string: "https://github.com/glbrom")!
    @State private var info: [Info] = simpleInfo
    @State private var activeInfo: Info?
    
    var body: some View {
//                NavigationView {
        
            
            VStack(spacing: 10) {
//                Spacer()
                    Button {
                        
                    } label: {
                        Text("Create Chat!")
                            .foregroundStyle(.black)
                            .fillButton(.white)
                            .shadow(color: .white, radius: 2)
                    }
//                    .frame(width: 300, height: 50)
                Button {
                    
                } label: {
                    Label("Info", systemImage: "info.circle")
                        .foregroundStyle(.black)
                        .fillButton(.white)
                        .shadow(color: .white, radius: 2)
                }
                
                    
                    Button {
                        UIApplication.shared.open(githubURL, options: [:], completionHandler: nil)
                    } label: {
                        Text("GitHub project")
                            .foregroundStyle(.black)
                            .fillButton(.white)
                            .shadow(color: .white, radius: 2)
                    }
//                    .frame(width: 300, height: 50)
                    .padding(.top, 20)
       
              
//                Spacer()
//                    NavigationLink(destination: ChatGPTView()) {
//                        Text("New Chat")
//                            .font(.custom("Poppins Bold", size: 20))
//                            .fontWeight(.light)
//                            .foregroundColor(Color.yellow)
//                            .multilineTextAlignment(.center)
//                            .frame(width: 180, height: 10)
//                            .padding()
//                            .background(Color.gray)
//                            .cornerRadius(8)
//                    }
//
//                    Button(action: {
//                        UIApplication.shared.open(githubURL, options: [:], completionHandler: nil)
//                    }) {
//                        Text("GitHub project")
//                            .foregroundColor(.white)
//                            .fillButton(.gray)
//                            .shadow(color: .white, radius: 1)
//                            .frame(width: 330, height: 50)
//                    }
                    
                }
            
            .padding(20)
    
            
       
    }
        
//        .accentColor(Color(.orange))
//    }
}

struct GetStartedButton_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedButton().preferredColorScheme(.dark)
    }
}
