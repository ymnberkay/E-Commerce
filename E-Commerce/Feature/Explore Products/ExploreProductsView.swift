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
            
            HStack {
                Text("Headphone")
                    .font(.customFont(size: FontSizes.headline))
                Spacer()
            }.padding(.horizontal)
                .padding(.bottom)
            
            HStack {
                Text("TMA Wireless")
                    .font(.customFont(size: FontSizes.title1))
                Spacer()
            }.padding(.horizontal)
            
            HorizontalStackScrollView(viewModel: viewModel)
            ItemsScrollView(viewModel: viewModel)
            
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $viewModel.isSheetPresented) {
            Filter(viewModel: viewModel)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ExploreProductsView(viewModel: ExploreProductsViewModel())
}


private struct NavigationTopBarView: View {@Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack {
            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
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
                        .foregroundColor(.black)
                        .font(.customFont(size: FontSizes.caption1))
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray, lineWidth: 1.0))
            })
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item)
                            .font(.customFont(size: FontSizes.caption1))
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
                        Button(action: { }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                                    .frame(width: 155,height: 243)
                                Text("Item \(item)")
                                    .foregroundColor(.gray)
                                    .bold()
                            }
                            
                        })
                        
                        
                    }
                }
                .padding()
            }.padding(.top,25)
            
        }
    }
}
