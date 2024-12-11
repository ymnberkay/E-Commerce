//
//  Banner.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 28.10.2024.
//

import SwiftUI
import Kingfisher

struct Banner: View {
    
    var items: [ItemDetail]
    var index: Int
    var action: () -> Void
    var isLoading: Bool
    
    var body: some View {
        HStack {
            if isLoading {
                ProgressView()
            } else {
                VStack(alignment: .leading){
                    
                    Text(items[index].name ?? "")
                        .font(.customFont(size: FontSizes.title1))
                        .padding(.vertical)
                    Button(action: action, label: {
                        Text("Shop now ->")
                            .foregroundColor(.caribbeanGreen)
                    })
                }
                KFImage(URL(string: items[index].image ?? ""))
                    .placeholder{
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                
            }
            
        }
        .padding()
        .frame(width: 326, height: 178)
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(.white))
    }
}

//#Preview {
//    Banner(items: ["Berkay","Test"], index: 1, action: {})
//}
