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
    @Published var sortCategory = ["Popularity","High Price", "Low Price"]
    let filterFeatures = ["Popularity", "Newest", "Oldest", "High Price", "Low Price", "Review"]
    @Published var columns = [GridItem(.flexible()), GridItem(.flexible())]
    @Published var featureColumns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @Published var selectedItem: String = ""
    @Published var lowPriceValue: String = ""
    @Published var highPriceValue: String = ""
    @Published var isSheetPresented: Bool = false
    
    @Published var firstItemArray: [ItemDetail] = []
    @Published var updatedArray: [ItemDetail] = []
    
    @Published var navigateToShopping: Bool = false
    
    func sortArray(itemArray: [ItemDetail], sortOption: SortOption) {
        switch sortOption {
        case .none:
            updatedArray = itemArray
        case .popularity:
            updatedArray = itemArray.sorted { $0.views ?? 0 > $1.views ?? 0 }
        case .lowPrice:
            updatedArray = itemArray.sorted { $0.price ?? 0.0 < $1.price ?? 0}
        case .highPrice:
            updatedArray = itemArray.sorted { $0.price ?? 0.0 > $1.price ?? 0}
            
        }
    }
    
    func filterPriceValue(itemArray: [ItemDetail], highPriceValue: Double, lowPriceValue: Double) -> [ItemDetail] {
        return itemArray.filter { item in
                let price = item.price ?? 0
                return price >= lowPriceValue && price <= highPriceValue
            }
    }
    
    
}
