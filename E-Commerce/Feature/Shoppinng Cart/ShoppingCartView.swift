//
//  ShoppingCartView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 10.01.2025.
//

import SwiftUI

struct ShoppingCartView: View {
    @StateObject var viewModel: PurchasedProductsViewModel
    var body: some View {
        VStack {
            NavigationTopBarView( action: {
                
            })
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ShoppingCartView(viewModel: PurchasedProductsViewModel())
}


private struct NavigationTopBarView: View {@Environment(\.presentationMode) var presentationMode
    var action: () -> Void
    var body: some View {
        HStack {
            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                Image("arrow-left")
            })
            Spacer()
            Text("Shopping Card")
                .font(.customFont(size: FontSizes.headline))
            Spacer()
            Button(action: {}, label: {
                Image("trash-2")
            })
            
        }.padding()
    }
}
