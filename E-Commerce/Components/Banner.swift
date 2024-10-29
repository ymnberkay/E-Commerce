//
//  Banner.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 28.10.2024.
//

import SwiftUI

struct Banner: View {
    
    var items: [ String]
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                
                Text(items[index])
                    .font(.customFont(size: FontSizes.title1))
                    .padding(.vertical)
                Button(action: {}, label: {
                    Text("Shop now ->")
                        .foregroundColor(.caribbeanGreen)
                })
            }
            Image("placeholderhp")
        }
        .padding()
        .frame(width: 326, height: 178)
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(.white))
    }
}

#Preview {
    Banner(items: ["Berkay","Test"], index: 1)
}
