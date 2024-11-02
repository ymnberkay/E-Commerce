//
//  SearchView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 29.10.2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    var body: some View {
        VStack {
            NavigationTopBarView()
            Spacer()
            InputTextField(textInput: viewModel.inputText, opacity: 0.5)
            LastestSearchView()
            PopularProductsView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}

private struct NavigationTopBarView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        HStack {
            Button(action: {dismiss()}, label: {
                Image("arrow-left")
            })
            Spacer()
            Text("Search")
            Spacer()
            Button(action: {}, label: {
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
    var body: some View {
        HStack {
            Text("Popular Products")
                .font(.customFont(size: 16))
            Spacer()
        }.padding()
        ForEach(Range(uncheckedBounds: (0,3))) { index in
            HStack {
                Image("placeholderhp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.black.opacity(0.1)))
                VStack(alignment: .leading) {
                    Text("TMA-2 Comfort Wireless")
                        .font(.customFont(size: 16))
                        .padding(.vertical)
                    Text("USD 250")
                        .font(.customFont(size: 16))
                    HStack {
                        Image("star-filled")
                        Text("5.6")
                            .font(.customFont(size: 16))
                        Text("86 reviews")
                            .font(.customFont(size: 16))
                    }
                    .padding(.vertical)
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
}
