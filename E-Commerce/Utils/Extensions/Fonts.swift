//
//  Fonts.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.10.2024.
//

import SwiftUI

extension Font {
    static func customFont(size: CGFloat) -> Font {
        return .custom("DMSans.ttf", size: size)
    }
}

struct FontSizes {
    static let headline: Double = 16
    static let largeTitle: Double = 51
    static let title1: Double = 28
    static let caption1: Double = 14
}
