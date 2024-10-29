//
//  SmallBanner.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 29.10.2024.
//

import SwiftUI

struct SmallBanner: View {
    var items: [ String]
    var index: Int
    var price: Int
    var body: some View {
        VStack(spacing: 10) {
            Image("placeholderhp")
            Text(items[index])
                .font(.customFont(size: FontSizes.caption1))
                .lineLimit(1)
            Text("USD \(price)")
                .font(.customFont(size: FontSizes.caption1))
        }.frame(width: 155, height: 200).background(RoundedRectangle(cornerRadius: 15).fill(.white))
    }
}

#Preview {
    SmallBanner(items: ["test", "test1"], index: 1, price: 350)
}
