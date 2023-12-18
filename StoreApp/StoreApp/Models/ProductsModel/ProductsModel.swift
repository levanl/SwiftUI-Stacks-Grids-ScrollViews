//
//  ProductsModel.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import Foundation

// MARK: - ProductsModel
struct ProductsModel: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    var stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
