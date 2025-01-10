//
//  ProductDetail.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 10.01.2025.
//

import Foundation

// MARK: - ProductDetail
struct ProductDetail: Codable {
    let product: Product
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let name: String?
    let price: Double?
    let currency: String?
    let views: Int?
    let rating: Double?
    let images: [String]?
    let reviews: [ProductReview]?
    let relatedProducts: [RelatedProduct]?
}

// MARK: - RelatedProduct
struct RelatedProduct: Codable,Identifiable {
    let id: Int?
    let name: String?
    let price: Double?
    let currency: String?
    let image: String?
}

// MARK: - Review
struct ProductReview: Codable {
    let username: String?
    let rating: Int?
    let comment, date: String?
    let images: [String]?
}
