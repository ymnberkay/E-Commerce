//
//  SmallBanner.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 29.10.2024.
//

import SwiftUI
import Kingfisher

struct SmallBanner: View {
    var items: [ItemDetail]
    var index: Int
    var price: Int
    var body: some View {
        VStack(spacing: 10) {
            KFImage(URL(string: items[index].image ?? ""))
                .placeholder{
                    ProgressView()
                }
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
            Text(items[index].name ?? "")
                .font(.customFont(size: FontSizes.caption1))
                .lineLimit(1)
            Text("USD \(String(describing: items[index].price ?? 0.0))")
                .font(.customFont(size: FontSizes.caption1))
        }.frame(width: 155, height: 200).background(RoundedRectangle(cornerRadius: 15).fill(.white))
    }
}

//#Preview {
//    SmallBanner(items: ["test", "test1"], index: 1, price: 350)
//}
