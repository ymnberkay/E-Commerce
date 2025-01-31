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
            NavigationTopBarView( actionTrash: {
                viewModel.removeAllPurchasedProductList()
            })
            
            ScrollView {
                VStack {
                    ForEach(viewModel.purchasedProductsList ?? [], id: \.self) { item in
                        ShoppingCart(shoppingCartItem: item, actionPlus: viewModel.increaseCounter, actionMinus: viewModel.decreaseCounter, actionTrash: viewModel.deleteItem)
                    }
                }
            }
            HStack {
                Text("Total \(viewModel.purchasedProductsList.count) item")
                    .padding()
                Spacer()
                Text("\(viewModel.totalItemPrice) USD")
                    .padding()
            }
            BottomButton(action: {}, title: "Proceed to Checkout")
        }.navigationBarBackButtonHidden(true)
            .onAppear {
                viewModel.countTotalPrice()
            }
            .onChange(of: viewModel.purchasedProductsList) { oldValue, newValue in
                viewModel.countTotalPrice()
            }
    }
}

#Preview {
    ShoppingCartView(viewModel: PurchasedProductsViewModel())
}


private struct NavigationTopBarView: View {@Environment(\.presentationMode) var presentationMode
    var actionTrash: () -> Void
    var body: some View {
        HStack {
            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                Image("arrow-left")
            })
            Spacer()
            Text("Shopping Card")
                .font(.customFont(size: FontSizes.headline))
            Spacer()
            Button(action: actionTrash, label: {
                Image("trash-2")
            })
            
        }.padding()
    }
}


private struct BottomButton: View {
    var action: () -> Void
    var title: String
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .font(.customFont(size: FontSizes.headline))
                .background(Color.primaryColor)
                .foregroundColor(.white)
                .cornerRadius(10)
            
        }.padding()
    }
}
