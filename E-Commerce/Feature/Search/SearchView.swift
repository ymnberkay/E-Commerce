//
//  SearchView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 29.10.2024.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    @StateObject var purchasedProductViewModel: PurchasedProductsViewModel
    let itemDetail: [ItemDetail]?
    
    var body: some View {
        VStack {
            NavigationTopBarView(viewModel: viewModel)
            Spacer()
            InputTextField(textInput: viewModel.inputText, opacity: 0.5)
            LastestSearchView()
            PopularProductsView(itemDetail: itemDetail)
        }
        .onAppear {
            viewModel.navigateToShopping = false
        }
        .navigationDestination(isPresented: $viewModel.navigateToShopping, destination: {
            ShoppingCartView(viewModel: purchasedProductViewModel)
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel(), purchasedProductViewModel: PurchasedProductsViewModel(), itemDetail: [ItemDetail]())
}

private struct NavigationTopBarView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: SearchViewModel
    var body: some View {
        HStack {
            Button(action: {dismiss()}, label: {
                Image("arrow-left")
            })
            Spacer()
            Text("Search")
            Spacer()
            Button(action: {viewModel.navigateToShopping = true}, label: {
                Image("shopping-cart")
            })
            
        }.padding()
    }
}



struct LastestSearchView: View {
    
    var body: some View {
            HStack {
                Text("Lastest Search")
                    .font(.customFont(size: 16))
                Spacer()
            }
            .padding()
            ForEach(Range(uncheckedBounds: (0,2))) { index in
                HStack(spacing: 20) {
                    Image("clock")
                    Text("\(index)")
                        .font(.customFont(size: 16))
                    Spacer()
                    Button(action: {}, label: {
                        Image("x")
                    })
                    
                }.padding()
            }
    }
}

struct PopularProductsView: View {
    
    let itemDetail: [ItemDetail]?
    
    var body: some View {
        HStack {
            Text("Popular Products")
                .font(.customFont(size: 16))
            Spacer()
        }.padding()
        ForEach(Range(uncheckedBounds: (0,3))) { index in
            HStack {
                KFImage(URL(string: itemDetail?[index].image ?? ""))
                    .placeholder{
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                VStack(alignment: .leading) {
                    Text(itemDetail?[index].name ?? "")
                        .font(.customFont(size: 16))
                        .padding(.vertical)
                    Text("USD \(String(describing: itemDetail?[index].price ?? 0.0))")
                        .font(.customFont(size: 16))
                    HStack {
                        Image("star-filled")
                        Text("\(String(describing: itemDetail?[index].rating ?? 0.0))")
                            .font(.customFont(size: 16))
                        Text("\(String(describing: itemDetail?[index].views ?? 0)) reviews")
                            .font(.customFont(size: 16))
                    }
                    .padding(.vertical)
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
}
