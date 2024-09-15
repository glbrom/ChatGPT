//
//  ChatGPTMacApp.swift
//  ChatGPTMac
//
//  Created by Macbook on 07.08.2023.
//

import SwiftUI

@main
struct ChatGPTMacApp: App {
    
    var body: some Scene {
        MenuBarExtra("ChatGPT", image: "ToolbarIcon") {
            ZStack {
                Image("darkSurface1")
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 5, opaque: true)
                VStack {
                    HStack {
                        
                        Text("ChatGPT").font(.title)
                            .padding(.leading, 6)
                        
                        Spacer()
                        Button {
                            exit(0)
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 1, height: 1)
                                .font(.system(size: 14))
                                .foregroundColor(Color.white)
                                .padding()
                                .background(Color("AccentColor"))
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 6)
                        .buttonStyle(.borderless)
                        
                    }
                    .padding()
                    ChatMacView()
                        .padding(.top, -8)
                        .padding(.bottom, 8)
                    
                    
                    
                }
                .padding(.top, -12)
                
            }
            .frame(width: 440, height: 500)
        }
        .menuBarExtraStyle(.window)
    }
}
