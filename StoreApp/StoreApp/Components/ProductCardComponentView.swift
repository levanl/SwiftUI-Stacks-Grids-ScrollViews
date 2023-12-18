//
//  ProductCardComponentView.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import SwiftUI

struct ProductCardComponentView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    let product: Product
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(
                url: URL(string: product.images.first ?? "wrong image"),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 150, maxHeight: 100)
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            HStack {
                VStack(spacing: 5){
                    Text("₾\(product.price)")
                        .font(.system(size: 15))
                        .frame(maxWidth: 100, alignment: .leading)
                    
                    Text(product.title)
                        .font(.system(size: 10).bold())
                        .frame(maxWidth: 100, alignment: .leading)
                }
                
                
                HStack {
                    Button(action: {
                        viewModel.addProduct(for: product)
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.green)
                    }
                    .disabled(product.stock == 0)
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        if viewModel.isDecrementButtonEnabled(for: product) {
                            viewModel.decrementProduct(for: product)
                        }
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(viewModel.isDecrementButtonEnabled(for: product) ? .red : .gray)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
            }
        }
        
    }
}

#Preview {
    ProductCardComponentView(product: Product(id: 10, title: "Iphone 9 pro", description: "vava magqria", price: 3900, discountPercentage: 20.00, rating: 9.0, stock: 30, brand: "Iphone", category: "Phones", thumbnail: "Phone", images: ["https://i.dummyjson.com/data/products/2/thumbnail.jpg"]))
        .environmentObject(MainViewModel())
    
}
