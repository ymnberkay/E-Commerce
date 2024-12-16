//
//  ExploreProductsView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 2.11.2024.
//

import SwiftUI
import Kingfisher

struct ExploreProductsView: View {
    @StateObject var viewModel: ExploreProductsViewModel
    let itemDetail: [ItemDetail]?
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
            
            HorizontalStackScrollView(viewModel: viewModel, itemDetail: itemDetail)
            ItemsScrollView(viewModel: viewModel)
            
        }
        .onAppear {
            if let itemDetail = itemDetail {
                viewModel.sortArray(itemArray: itemDetail, sortOption: .none)
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $viewModel.isSheetPresented) {
            Filter(viewModel: viewModel)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ExploreProductsView(viewModel: ExploreProductsViewModel(), itemDetail: [ItemDetail(id: 1, name: "Airpods 2", price: 200.0, views: 269, rating: 3.5, image: "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/apple/thumb/0003-layer-3_large.jpg")])
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
    let itemDetail: [ItemDetail]?
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
                    ForEach(viewModel.sortCategory, id: \.self) { item in
                        Text(item)
                            .font(.customFont(size: FontSizes.caption1))
                            .padding()
                            .onTapGesture {
                                if item == "Popularity" {
                                    viewModel.sortArray(itemArray: viewModel.sortedArray, sortOption: .popularity)
                                } else if item == "Low Price" {
                                    viewModel.sortArray(itemArray: viewModel.sortedArray, sortOption: .lowPrice)
                                } else if item == "High Price" {
                                    viewModel.sortArray(itemArray: viewModel.sortedArray, sortOption: .highPrice)
                                }
                            }
                            
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
                    ForEach(viewModel.sortedArray, id: \.self) { item in
                        Button(action: { }, label: {
                            ItemCardView(item: item)
                        })
                        
                        
                    }
                }
                .padding()
            }.padding(.top,25)
            
        }
    }
}

private struct ItemCardView: View {
    let item: ItemDetail
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(width: 155,height: 243)
            VStack {
                KFImage(URL(string: item.image ?? ""))
                    .placeholder{
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                VStack(alignment: .leading) {
                    Text("\(item.name ?? "")")
                        .font(.customFont(size: FontSizes.headline))
                        .lineLimit(1)
                        .foregroundColor(.black)
                    Text("USD \(String(format: "%.1f", item.price ?? 0.0))")
                        .font(.customFont(size: FontSizes.headline))
                        .foregroundColor(.black)
                    HStack {
                        Image("star-filled")
                        Text(String(format: "%.1f", item.rating ?? 0.0))
                            .font(.customFont(size: FontSizes.caption1))
                            .foregroundColor(.black)
                        Text("\(item.views ?? 0) Reviews")
                            .font(.customFont(size: FontSizes.caption1))
                            .foregroundColor(.black)
                        
                    }
                }
                
            }
            
        }
        .padding()
        .frame(width: 155,height: 243)
    }
}


//#Preview {
//    ItemCardView(item: ItemDetail(id: 1, name: "Airpods 2", price: 200.0, views: 269, rating: 3.5, image: "https://cdn.vatanbilgisayar.com/Upload/PRODUCT/apple/thumb/0003-layer-3_large.jpg"))
//}
