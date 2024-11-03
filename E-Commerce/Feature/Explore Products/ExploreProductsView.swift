//
//  ExploreProductsView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 2.11.2024.
//

import SwiftUI

struct ExploreProductsView: View {
    @StateObject var viewModel: ExploreProductsViewModel
    var body: some View {
        VStack {
            NavigationTopBarView()
            Text("Headphone")
            Text("TMA Wireless")
            HorizontalStackScrollView(viewModel: viewModel)
            ItemsScrollView(viewModel: viewModel)
            
        }
        .sheet(isPresented: $viewModel.isSheetPresented) {
            Filter(viewModel: viewModel)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ExploreProductsView(viewModel: ExploreProductsViewModel())
}


private struct NavigationTopBarView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        HStack {
            Button(action: {dismiss()}, label: {
                Image("arrow-left")
            })
            Spacer()
            Button(action: {}, label: {
                Image("shopping-cart")
            })
            
        }.padding()
    }
}

private struct HorizontalStackScrollView: View {
    @StateObject var viewModel: ExploreProductsViewModel
    var body: some View {
        HStack {
            Button(action:  {viewModel.isSheetPresented = true }, label: {
                HStack {
                    Image("sliders")
                    Text("Filter")
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 1.0))
            })
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item)
                            .padding()
                    }
                }
            }.padding(.leading)
        }
        .padding()
    }
}

private struct ItemsScrollView: View {
    @StateObject var viewModel: ExploreProductsViewModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .opacity(0.1)
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: viewModel.columns, spacing: 16) {
                    ForEach(viewModel.itemss, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .frame(width: 155,height: 243)
                            .overlay(
                                Text("Item \(item)")
                                    .foregroundColor(.gray)
                                    .bold()
                            )
                    }
                }
                .padding()
            }.padding(.top,25)
            
        }
    }
}
