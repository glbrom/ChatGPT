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
//    @State var showDetail = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
//            let safeArea = $0.safeAreaInsets
            
                ZStack {
                   
                   
                    VStack(spacing: 1) {
                        if let activeInfo {
                            Rectangle()
                                .fill(Color.black)
                            //                            .fill(activeInfo.bgColor)
                                .padding(.bottom, -30)
                            
                                .overlay {
                                    Circle()
//                                        .fill(activeInfo.circleColor)
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
                        
//                            .padding(.bottom, safeArea.bottom)
                            .padding(.bottom, -20)
//                            .padding(safeArea.bottom)
//                            .padding(.top, 100)
    //                        .offset(y: 20)
                        //                            .background(.black, in: .rect(topLeadingRadius: 25, topTrailingRadius: 25))
                        //                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 8)
                        
                        //                            .background {
                        //                                TransparentBlurView(removeAllFilters: true)
                        //                                    .blur(radius: 9, opaque: true)
                        //                                    .background(.black.opacity(0.05))
                        //                            }
                        //                            .clipShape(.rect(cornerRadius: 10, style: .continuous))
                        //                            .background {
                        //                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                        //                                    .stroke(.black.opacity(0.5), lineWidth: 2)
                        //                            }
                        //                            .shadow(color: .black.opacity(0.2), radius: 10)
                        
                        
                        
                    }
                  
                    
                    .background(.black)
                
                MatrixView().blur(radius: 2)
                    .padding(.bottom, 480)
                
                    .ignoresSafeArea()
                
                
                }
            
          
                
//                                    InfoView(showDetail: $showDetail)
//                    .offset(y: showDetail ? 0 : 500)
//                                        .background {
//                                            TransparentBlurView(removeAllFilters: true)
//                                                .blur(radius: 9, opaque: true)
//                                                .background(Color("MatrixColor").opacity(0.15))
//                                        }
//                                        .clipShape(.rect(cornerRadius: 20, style: .continuous))
//                                        .background {
//                                            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                                                .stroke(.white.opacity(0.2), lineWidth: 2)
//                                        }
//                                        .shadow(color: .gray.opacity(0.4), radius: 10)
//                                        .frame(width: 360, height: 200, alignment: .center)
//                                        .animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0))
//                                        .offset(y: showDetail ? 0 : 100)
                
            
         

     
               
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
//                            activeInfo?.bgColor = info[index + 1].bgColor
                            
                            
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

#Preview {
    HomeScreenView()
}
