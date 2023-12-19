//
//  CategoriesModel.swift
//  StoreApp
//
//  Created by Levan Loladze on 18.12.23.
//

import SwiftUI

// MARK: - CategoryModel
struct Category: Identifiable, Hashable {
    let id = UUID()
    let name: String
}
