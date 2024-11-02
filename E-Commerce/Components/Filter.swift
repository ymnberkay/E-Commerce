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
            HStack {
                Text("Filter")
                Spacer()
                Button(action: { }, label: {
                    Image("x")
                })
            }.padding()
            HStack {
                Text("Category")
                Spacer()
            }.padding(.horizontal)
            
            CategoryList()
            
            HStack {
                Text("Sort by")
                Spacer()
            }.padding(.horizontal)
            
            ExtractedView(viewModel: viewModel)
        }
    }
}

#Preview {
    Filter(viewModel: ExploreProductsViewModel())
}

struct ExtractedView: View {
    @StateObject var viewModel: ExploreProductsViewModel
    var body: some View {
        LazyVGrid(columns: viewModel.featureColumns) {
            ForEach(viewModel.filterFeatures, id: \.self) { feature in
                Text(feature)
                    .padding()
                    .background(viewModel.selectedItem == feature ? Color.caribbeanGreen : Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .onTapGesture {
                        viewModel.selectedItem = feature
                    }
                
            }
        }
    }
}
