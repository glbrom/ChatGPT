//
//  HomeView.swift
//  ChatGPT
//
//  Created by Macbook on 30.07.2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var info: [Info] = simpleInfo
    @State private var activeInfo: Info?
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            
            VStack(spacing: 1) {
             
                    Rectangle()
                        .fill(activeInfo.bgColor)
                        .padding(.bottom, -30)
                        .overlay {
                            Circle()
                                .fill(activeInfo.circleColor)
                                .frame(width: 40, height: 40)
                                .background(alignment: .leading, content: {
                                    Capsule()
                                        .fill(activeInfo.bgColor)
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
                                .offset(x: -activeInfo!.circleOffset)
                        }
          
                GetStartedButton()
                    .padding(.bottom, safeArea.bottom)
                    .padding(.top, 20)
                    .background(.black, in: .rect(topLeadingRadius: 25, topTrailingRadius: 25))
                    .shadow(color:.black.opacity(0.1), radius: 5, x: 0, y: 8)

                //                    .background(.black, in: .rect(topLeadingRadius: 25, topTrailingRadius: 25)
                
//                    .background(.black)
//                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    
            }
            .ignoresSafeArea()
        }
        .task {
            if activeInfo == nil {
                activeInfo = simpleInfo.first
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
          
                withAnimation(.snappy(duration: 0.9), completionCriteria: .removed) {
                    activeInfo?.textOffset = -(textSize(info[index].text) + 20)
                    activeInfo?.circleOffset = -(textSize(info[index].text) + 20) / 2
                } completion: {
                   
                        withAnimation(.snappy(duration: 1), completionCriteria: .logicallyComplete) {
                            activeInfo?.textOffset = 0
                            activeInfo?.circleOffset = 0
                            activeInfo?.circleColor = info[index + 1].circleColor
                            activeInfo?.bgColor = info[index + 1].bgColor
                            
                            
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
    
//    func animate(_ index: Int, _ loop: Bool = true) {
//        if info.indices.contains(index + 1) {
//            activeInfo?.text = info[index].text
//            activeInfo?.textColor = info[index].textColor
//            withAnimation(Animation.easeInOut(duration: 1).delay(0.1)) {
//                activeInfo?.textOffset = -(textSize(info[index].text) + 20)
//                activeInfo?.circleOffset = -(textSize(info[index].text) + 20) / 2
//            }
//
//            // Вместо completion блока нет необходимости в новом синтаксисе
//            withAnimation(Animation.easeInOut(duration: 0.8).delay(0.1)) {
//                activeInfo?.textOffset = 0
//                activeInfo?.circleOffset = 0
//                activeInfo?.circleColor = info[index + 1].circleColor
//                activeInfo?.bgColor = info[index + 1].bgColor
//                animate(index + 1, loop)
//            }
//
//
//        } else {
//            if loop {
//                animate(0, loop)
//            }
//        }
//    }
// 



    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
