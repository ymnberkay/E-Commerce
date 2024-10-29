//
//  CategoryList.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 28.10.2024.
//

import SwiftUI

struct CategoryList: View {
    @State private var selectedIndex = 0
    let items = ["Headphone", "Headband", "Earpads", "Cable"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(items.indices, id: \.self) { index in
                    Text(items[index])
                        .font(.customFont(size: FontSizes.caption1))
                        .padding()
                        .opacity(0.5)
                        .frame(height: 18)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(selectedIndex == index ? Color.caribbeanGreen : Color.clear)
                        )
                        .onTapGesture {
                            selectedIndex = index
                        }
                }
                .frame(height: 25)
            }
            .padding()
        }
    }
    
}

#Preview {
    CategoryList()
}
