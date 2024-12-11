//
//  Headphone.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 11.12.2024.
//

import Foundation

// MARK: - Items
struct Items: Codable {
    let products: [ItemDetail]?
}

// MARK: - Product
struct ItemDetail: Codable {
    let id: Int?
    let name: String?
    let price: Double?
    let views: Int?
    let rating: Double?
    let image: String?
}
