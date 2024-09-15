//
//  ContentView.swift
//  ChatGPT
//
//  Created by Macbook on 06.08.2023.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var info: [HeaderHomeModel] = headerInfoView
    @State private var activeInfo: HeaderHomeModel?
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            ZStack {
                
                VStack(spacing: 1) {
                    if let activeInfo {
                        Rectangle()
                            .fill(Color.black)
                            .padding(.bottom, -30)
                            .overlay {
                                Circle()
                                    .fill(Color("TextCloseColor"))
                                    .frame(width: 40, height: 40)
                                    .background(alignment: .leading, content: {
                                        Capsule()
                                            .fill(Color("TextCloseColor"))
                                            .frame(width: size.width)
                                    })
                                    .background(alignment: .leading) {
                                        Text(activeInfo.text)
                                            .font(.largeTitle)
                                            .foregroundStyle(activeInfo.textColor)
                                            .frame(width: textSize(activeInfo.text))
                                            .offset(x: activeInfo.circleOffset * 2)
                                            .offset(x: 10)
                                    }
                                    .offset(x: -activeInfo.circleOffset)
                            }
                    }
                    
                    ButtonBlockView()
                        .padding(.bottom, -20)
                }
                .background(.black)
                
                MatrixView().blur(radius: 2)
                    .padding(.bottom, 480)
                    .ignoresSafeArea()
            }
        }
        .task {
            if activeInfo == nil {
                activeInfo = headerInfoView.first
                let nanoSeconds = UInt64(1_000_000_000 * 0.25)
                try? await Task.sleep(nanoseconds: nanoSeconds)
                animate(0)
            }
        }
    }
    
    func animate(_ index: Int, _ loop: Bool = true) {
        if info.indices.contains(index + 1) {
            activeInfo?.text = info[index].text
            activeInfo?.textColor = info[index].textColor
            
            withAnimation(.snappy(duration: 1), completionCriteria: .removed) {
                activeInfo?.textOffset = -(textSize(info[index].text) + 20)
                activeInfo?.circleOffset = -(textSize(info[index].text) + 20) / 2
            } completion: {
                
                withAnimation(.snappy(duration: 0.9), completionCriteria: .logicallyComplete) {
                    activeInfo?.textOffset = 0
                    activeInfo?.circleOffset = 100
                    activeInfo?.circleColor = info[index + 1].circleColor
                } completion: {
                    animate(index + 1, loop)
                }
            }
        } else {
            if loop {
                animate(0, loop)
            }
        }
    }
    
}

#Preview {
    HomeScreenView()
}
