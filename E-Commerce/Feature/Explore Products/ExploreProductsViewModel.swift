//
//  ExploreProductsViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 2.11.2024.
//

import Foundation
import SwiftUI


//** You must make a new viewModel for filter view **

final class ExploreProductsViewModel: ObservableObject {
    @Published var sortCategory = ["Popularity","Most expensive", "Low Price"]
    let filterFeatures = ["Popularity", "Newest", "Oldest", "High Price", "Low Price", "Review"]
    @Published var  columns = [GridItem(.flexible()), GridItem(.flexible())]
    @Published var  featureColumns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @Published var selectedItem: String = ""
    @Published var lowPriceValue: String = ""
    @Published var highPriceValue: String = ""
    @Published var isSheetPresented: Bool = false
    
    @Published var firstItemArray: [ItemDetail] = []
    @Published var sortedArray: [ItemDetail] = []
    
    
    func sortArray(itemArray: [ItemDetail], sortOption: SortOption) {
        switch sortOption {
        case .none:
            sortedArray = itemArray
        case .popularity:
            sortedArray = itemArray.sorted { $0.views ?? 0 > $1.views ?? 0 }
        case .lowPrice:
            sortedArray = itemArray.sorted { $0.price ?? 0.0 < $1.price ?? 0}
        case .highPrice:
            sortedArray = itemArray.sorted { $0.price ?? 0.0 > $1.price ?? 0}

        }
    }
    
}
