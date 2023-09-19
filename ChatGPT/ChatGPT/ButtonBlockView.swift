//
//  ButtonBlockView.swift
//  ChatGPT
//
//  Created by Macbook on 06.08.2023.
//

import SwiftUI

struct ButtonBlockView: View {
    
    private let githubURL = URL(string: "https://github.com/glbrom")!
    
    @State private var isPresentingNewView = false
    @State var showDetail = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Button {
                    isPresentingNewView = true
                } label: {
                    Text("Create chat")
                        .foregroundStyle(.white)
                        .fillButton(.black).opacity(0.8)
                        .shadow(color: .black, radius: 2)
                }
                .fullScreenCover(isPresented: $isPresentingNewView) {
                    ChatView(isPresented: $isPresentingNewView)
                }
                
                Button {
                    self.showDetail.toggle()
                } label: {
                    Text("Info")
                        .foregroundStyle(.white)
                        .fillButton(.black).opacity(0.8)
                        .shadow(color: .black, radius: 2)
                }
                
                Button {
                    UIApplication.shared.open(githubURL, options: [:], completionHandler: nil)
                } label: {
                    Text("GitHub project")
                        .foregroundStyle(.white)
                        .fillButton(.black).opacity(0.8)
                        .shadow(color: .black, radius: 2)
                }
                .padding(.top, 20)
            }
            .padding(20)
            .background {
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: 9, opaque: true)
                    .background(Color("MatrixColor").opacity(0.15))
            }
            .clipShape(.rect(cornerRadius: 20, style: .continuous))
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.white.opacity(0.2), lineWidth: 2)
            }
            .shadow(color: .gray.opacity(0.4), radius: 10)
            .frame(width: 360, height: 200, alignment: .center)
            
            InfoView(showDetail: $showDetail)
                .offset(y: showDetail ? -320 : 800)
                .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0))
                .opacity(0.98)
        }
    }
}

#Preview {
    ButtonBlockView().preferredColorScheme(.dark)
}
