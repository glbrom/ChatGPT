//
//  Info.swift
//  ChatGPT
//
//  Created by Macbook on 30.07.2023.
//

import SwiftUI

// Model
struct Info: Identifiable {
    var id: UUID = .init()
    var text: String
    var textColor: Color
    var circleColor: Color
    var bgColor: Color
    var circleOffset: CGFloat = 0
    var textOffset: CGFloat = 0
}

// Infos
var simpleInfo: [Info] = [
    .init(text: "ChatGPT", textColor: Color.white, circleColor: Color.blue, bgColor: Color.yellow),
    .init(text: "Let's Start", textColor: Color.yellow, circleColor: Color.black, bgColor: Color.pink),
    .init(text: "Project on Github", textColor: Color.black, circleColor: Color.red, bgColor: Color.green),
    .init(text: "Created by gR", textColor: Color.yellow, circleColor: Color.red, bgColor: Color.red),
]
