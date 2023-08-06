//
//  Helper.swift
//  ChatGPT
//
//  Created by Macbook on 30.07.2023.
//

import SwiftUI

func textSize(_ text: String) -> CGFloat {
    return NSString(string: text).size(withAttributes: [.font: UIFont.preferredFont(forTextStyle: .largeTitle)]).width
}

extension View {
    func fillButton(_ color: Color) -> some View {
        self
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
//            .background(color, in: .rect(cornerRadius(15))) // xcode15
            .background(color, in: .rect(cornerRadius: 15))
       
        
//                        .fontWeight(.bold)
//                        .frame(maxWidth: .infinity)
//                        .padding(.vertical, 15)
//                        .background(color)
//                        .cornerRadius(15)
    }
}

//    .background(Color.white).opacity(0.2)
//    .clipShape(RoundedRectangle(cornerRadius: 15))
