//
//  ProductsView.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import SwiftUI

struct ProductsView: View {
    
    // MARK: - Properties
    let category: String
    @EnvironmentObject private var viewModel: MainViewModel
    
    @Binding var path: NavigationPath
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                
                topBarView()
                
                Text("Products in \(category)")
                    .font(.title)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.products.filter { $0.category == category }) { product in
                            NavigationLink {
                                ProductDetailView(product: product, path: $path)
                            } label: {
                                ProductCardComponentView(product: product)
                                    .padding(.vertical)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

