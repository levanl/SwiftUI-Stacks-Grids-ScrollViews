//
//  ProductDetailView.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject private var viewModel: MainViewModel
    let product: Product
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    ProductDetailView(product: Product(id: 10, title: "Iphone 9 pro", description: "vava magqria", price: 3900, discountPercentage: 20.00, rating: 9.0, stock: 30, brand: "Iphone", category: "Phones", thumbnail: "Phone", images: ["https://i.dummyjson.com/data/products/2/thumbnail.jpg"]))
        .environmentObject(MainViewModel())
}
