//
//  Review.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 5.11.2024.
//

import SwiftUI

struct Review: View {
    var images: String
    var userName: String
    var filledStars: Int
    var reviewText: String
    var body: some View {
        HStack(alignment: .top) {
            Image(images)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(userName)
                        .font(.customFont(size: FontSizes.headline))
                    
                    Spacer()
                    
                    Text("1 Month ago")
                        .font(.customFont(size: FontSizes.caption1))
                        .foregroundColor(.gray)
                }
                HStack(spacing: 4) {
                    ForEach(0..<5) { index in
                        Image(systemName: index < filledStars ? "star.fill" : "star")
                            .foregroundColor(index < filledStars ? .yellow : .gray)
                    }
                }
                Text(reviewText)
                    .font(.customFont(size: FontSizes.caption1))
                    .foregroundColor(.black)
                
                
            }
        }.padding()
    }
}

#Preview {
    Review(images: "Ellipse 10", userName: "Madelina", filledStars: 3, reviewText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
}
