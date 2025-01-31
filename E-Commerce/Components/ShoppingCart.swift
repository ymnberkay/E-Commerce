//
//  ShoppingCart.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 11.01.2025.
//

import SwiftUI
import Kingfisher

struct ShoppingCart: View {
    var shoppingCartItem: PurchasedItem
    var actionPlus: (PurchasedItem) -> Void
    var actionMinus: () -> Void
    var actionTrash: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            KFImage(URL(string: shoppingCartItem.image ?? ""))
                .placeholder{
                    ProgressView()
                }
                .resizable()
                .scaledToFit()
                .frame(width: 87, height: 87)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                
            VStack(alignment: .leading, spacing: 5) {
                Text(shoppingCartItem.title ?? "")
                    .font(.customFont(size: FontSizes.headline))
                Text("\(String(describing: shoppingCartItem.price ?? 0.0))")
                    .font(.customFont(size: FontSizes.headline))
                
                HStack(spacing: 30) {
                    Button(action: actionMinus, label: {
                        Image(systemName: "minus")
                            .foregroundColor(.greyDark)
                            
                        
                    })
                    Text("\(shoppingCartItem.count)")
                        .font(.customFont(size: FontSizes.headline))
                    Button(action: {actionPlus(shoppingCartItem)
                    print(shoppingCartItem)}, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.greyDark)
                            
                        
                    })
                    Spacer()
                    Button(action: actionTrash, label: {
                        Image("trash-2")
                    })
                    
                }
                
            }
            
            
        }.frame(width: 326, height: 87)
    }
}

#Preview {
    ShoppingCart(shoppingCartItem: PurchasedItem(title: "TMA-2 Comfort Wireless", price: 200.0, image: "placeholderhp", count: 1),actionPlus: {_ in },actionMinus: {}, actionTrash: {})}
