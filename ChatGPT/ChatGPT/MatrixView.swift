//
//  MatrixView.swift
//  ChatGPT
//
//  Created by Macbook on 06.08.2023.
//

import SwiftUI

struct MatrixView: View {
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            HStack(spacing: 15) {
                ForEach(1...Int(size.width / 25), id: \.self) { _ in
                    MatrixCharacters(size: size)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MatrixCharacters: View {
    var size: CGSize
    // Animation Properties
    @State var startAnimation: Bool = false
    @State var random: Int = 0
    
    var body: some View {
        // Random Height
        let randomHeight: CGFloat = .random(in: (size.height / 2)...size.height)
        
        VStack {
            // Iteration String
            ForEach(0..<constant.count, id: \.self) { index in
                // Retriving Character at String
                let character = Array(constant)[getRandimindex(index: index)]
                
                Text(String(character))
                    .font(.custom("matrixcodenfi", size: 20))
                    .foregroundColor(Color("MatrixColor"))
            }
        }
        // Using Mask Animation
        .mask(alignment: .top) {
            Rectangle()
                .fill(
                    LinearGradient(colors: [
                        .clear,
                        .black.opacity(0.1),
                        .black.opacity(0.2),
                        .black.opacity(0.3),
                        .black.opacity(0.5),
                        .black.opacity(0.7),
                        .black
                    ], startPoint: .top, endPoint: .bottom)
                )
                .frame(height: size.height / 2)
            // Animating from top
                .offset(y: startAnimation ? size.height : -randomHeight)
        }
        .onAppear {
            // Moving slowly with linear
            // Endless loop without reversing
            withAnimation(.linear(duration: 12).delay(.random(in: 0...2)).repeatForever(autoreverses: false)) {
                startAnimation = true
            }
        }
        // Timer
        .onReceive(Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()) { _ in
            random = Int.random(in: 0..<constant.count)
        }
    }
    // random characters with the help of timer
    func getRandimindex(index: Int) -> Int {
        let max = constant.count - 1
        if (index + random) > max {
            if (index - random) < 0 {
                return index
            }
            return (index - random)
        }
        else {
            return (index + random)
        }
    }
}

// MARK: - Random Characters
let constant = "abcdefghijklmnopqrstuvwxyzabcquepaje123jdj"

#Preview {
    MatrixView()
}
