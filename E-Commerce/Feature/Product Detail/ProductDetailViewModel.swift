//
//  ProductDetailViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 5.11.2024.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    @Published  var selectedOption: Int = 0
    @Published var priceValue: Int?
    @Published var title: String?
    let options = ["Overview", "Features", "Specification"]
    @Published var productImages = ["placeholderhp", "placeholderhp", "placeholderhp"]
    @Published var reviewCount: Int?
    let products = [
            Product(image: "headphones", name: "TMA-2 HD Wireless", price: "USD 350"),
            Product(image: "cable", name: "CO2 - Cable", price: "USD 25")
        ]
}
struct Product: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let price: String
}
