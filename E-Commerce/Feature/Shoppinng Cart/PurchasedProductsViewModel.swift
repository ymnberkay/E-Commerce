//
//  PurchasedProductsViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 10.01.2025.
//

import Foundation

final class PurchasedProductsViewModel: ObservableObject {
    @Published var purchasedProductsList: [PurchasedItem]  = []
    @Published var totalItemPrice: Double = 0.0
    
    func addItem(item: PurchasedItem) {
        purchasedProductsList.append(item)
        
    }
    func increaseCounter(for item: PurchasedItem) {
        if let index = purchasedProductsList.firstIndex(where: { $0.title == item.title }) {
            purchasedProductsList[index].count += 1
        }
    }
    
    func removeAllPurchasedProductList() {
        self.purchasedProductsList = []
        self.totalItemPrice = 0.0
    }
    
    func decreaseCounter() {
        
    }
    
    func countTotalPrice() {
        for product in purchasedProductsList {
            totalItemPrice += product.price ?? 0.0
        }
    }
    
    func deleteItem() {
        
    }
}
