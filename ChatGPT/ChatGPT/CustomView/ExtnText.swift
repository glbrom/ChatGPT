//
//  ExtnText.swift
//  ChatGPT
//
//  Created by Macbook on 06.08.2023.
//

import SwiftUI

func textSize(_ text: String) -> CGFloat {
    return NSString(string: text).size(withAttributes: [.font: UIFont.preferredFont(forTextStyle: .largeTitle)]).width
}
