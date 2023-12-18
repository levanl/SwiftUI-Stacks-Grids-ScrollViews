//
//  ProductsView.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import SwiftUI

struct ProductsView: View {
    
    let category: String
    @EnvironmentObject private var viewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    Text("Bal: ₾\(viewModel.balance)")
                    
                    Spacer()
                    
                    Image(systemName: "cart.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 30))
                    Text("Cart (\(viewModel.totalItems))")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                }
                .padding()
                
                Text("Products in \(category)")
                    .font(.title)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(viewModel.products.filter { $0.category == category }) { product in
                            ProductCardComponentView(product: product)
                        }
                    }
                    .padding()
                }
                
                Text("Total: \(viewModel.totalPrice) ₾")
                
            }
        }
    }
}

#Preview {
    ProductsView(category: "laptops")
        .environmentObject(MainViewModel())
}
