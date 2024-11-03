//
//  ExploreProductsViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 2.11.2024.
//

import Foundation
import SwiftUI

final class ExploreProductsViewModel: ObservableObject {
    @Published var items = ["Popularity", "Newest", "Most expensive", "Low Price"]
    @Published var itemss = Array(1...20) // Örnek veriler
    let filterFeatures = ["Popularity", "Newest", "Oldest", "High Price", "Low Price", "Review"]
    @Published var  columns = [GridItem(.flexible()), GridItem(.flexible())]
    @Published var  featureColumns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @Published var selectedItem: String = ""
    @Published var lowPriceValue: String = ""
    @Published var highPriceValue: String = ""
    @Published var isSheetPresented: Bool = false
    
    
}
