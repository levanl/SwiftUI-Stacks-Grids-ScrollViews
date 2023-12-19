//
//  ProductDetailView.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: MainViewModel
    let product: Product
    @Binding var path: NavigationPath
    
    // MARK: - Body
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: product.images.first ?? "wrong image"),
                content: { image in
                    image.resizable()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipShape(.rect(cornerRadius: 20))
                },
                placeholder: {
                    ProgressView()
                }
            )
            .padding(30)
            
            Text(product.title)
                .font(.title)
                .padding()
            
            Spacer()
            
            Button("Go to Main Screen") {
                path = NavigationPath()
            }
            .padding(10)
            .foregroundColor(.black)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
    }
}
