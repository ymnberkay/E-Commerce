//
//  PurchasedItem.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 11.01.2025.
//

import Foundation

struct PurchasedItem: Codable, Hashable {
    let title: String?
    let price: Double?
    let image: String?
    var count: Int
}
