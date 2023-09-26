//
//  ExtnButton.swift
//  ChatGPT
//
//  Created by Macbook on 06.08.2023.
//

import SwiftUI

extension View {
    func fillButton(_ color: Color) -> some View {
        self
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .background(color, in: .rect(cornerRadius: 15))
       
//            .background(Color("\(color)"))
//            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
