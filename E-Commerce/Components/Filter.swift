//
//  Filter.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 2.11.2024.
//

import SwiftUI

struct Filter: View {
    @StateObject var viewModel: ExploreProductsViewModel
    var body: some View {
        VStack {
            TopNavView(viewModel: viewModel)
            HStack {
                Text("Category")
                    .font(.customFont(size: FontSizes.headline))
                Spacer()
            }.padding(.horizontal)
            CategoryList()
            SortByView(viewModel: viewModel)
            PriceRatingView(viewModel: viewModel)
            PrimaryButton(title: "Apply Filter") {
                
            }
            
        }
        .presentationDetents([.height(600)])
        
    }
}

#Preview {
    Filter(viewModel: ExploreProductsViewModel())
}

private struct SortByView: View {
    @StateObject var viewModel: ExploreProductsViewModel
    var body: some View {
        
        VStack {
            HStack {
                Text("Sort by")
                    .font(.customFont(size: FontSizes.headline))
                Spacer()
            }.padding(.horizontal)
            LazyVGrid(columns: viewModel.featureColumns) {
                ForEach(viewModel.filterFeatures, id: \.self) { feature in
                    Text(feature)
                        .font(.customFont(size: FontSizes.headline))
                        .padding()
                        .background(viewModel.selectedItem == feature ? Color.primaryColor : Color.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            viewModel.selectedItem = feature
                        }
                    
                }
            }.padding()
        }
    }
}

private struct PriceRatingView: View {
    @StateObject var viewModel: ExploreProductsViewModel
    var body: some View {
        HStack {
            Text("Price Rating")
                .font(.customFont(size: FontSizes.headline))
            Spacer()
        }.padding(.horizontal)
        HStack(spacing: 35) {
            TextField("Low Price", text: $viewModel.lowPriceValue)
                .font(.customFont(size: FontSizes.headline))
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
            
            TextField("High Price", text: $viewModel.highPriceValue)
                .font(.customFont(size: FontSizes.headline))
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
        }.padding()
    }
}

private struct TopNavView: View {
    @StateObject var viewModel: ExploreProductsViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        HStack {
            Text("Filter")
                .font(.customFont(size: FontSizes.title1))
            Spacer()
            Button(action: { viewModel.isSheetPresented = false }, label: {
                Image("x")
            })
        }.padding()
    }
}
