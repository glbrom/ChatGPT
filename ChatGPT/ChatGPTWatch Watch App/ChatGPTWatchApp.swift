//
//  ChatGPTWatchApp.swift
//  ChatGPTWatch Watch App
//
//  Created by Macbook on 07.08.2023.
//

import SwiftUI

@main
struct ChatGPTWatch_Watch_AppApp: App {
//    let openAIService = OpenAINetworkService()
//    @StateObject var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
//            NavigationStack {
               
//                ChatWatchView(isPresented: .constant(true))
            ChatWatchView()
//                    .navigationTitle("ChatGPT").font(.system(size: 15))
//                    .navigationBarTitleDisplayMode(.inline)
//                    .edgesIgnoringSafeArea(.all)
//                .frame(width: WKInterfaceDevice.current().screenBounds.width, height: WKInterfaceDevice.current().screenBounds.height)
                 
               
                
                    
//            }
        }
    }
}
