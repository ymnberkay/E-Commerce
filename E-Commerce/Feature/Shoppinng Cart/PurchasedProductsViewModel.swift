//
//  PurchasedProductsViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 10.01.2025.
//

import Foundation

final class PurchasedProductsViewModel: ObservableObject {
    @Published var purchasedProductsList: [Product]?
    
    func addItem(item: Product) {
        purchasedProductsList?.append(item)
    }
    
    
}
