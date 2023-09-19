//
//  HeaderHomeModel.swift
//  ChatGPT
//
//  Created by Macbook on 06.08.2023.
//

import SwiftUI

struct HeaderHomeModel: Identifiable {
    var id: UUID = .init()
    var text: String
    var textColor: Color
    var circleColor: Color
    var circleOffset: CGFloat = 0
    var textOffset: CGFloat = 0
}

var headerInfoView: [HeaderHomeModel] = [
    .init(text: "ChatGPT", textColor: Color("HeaderColor 1"), circleColor: Color.blue),
    .init(text: "Let's Start", textColor: Color("HeaderColor 2"), circleColor: Color.yellow),
    .init(text: "Project on Github", textColor: Color("HeaderColor 3"), circleColor: Color.green),
    .init(text: "Created by gR", textColor: Color("HeaderColor 4"), circleColor: Color.red),
    .init(text: "", textColor: Color("HeaderColor 3"), circleColor: Color.red)
    
]
