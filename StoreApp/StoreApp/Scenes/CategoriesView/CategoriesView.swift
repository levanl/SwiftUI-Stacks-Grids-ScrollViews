//
//  CategoriesView.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import SwiftUI

struct CategoriesView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.categories) { category in
                        
                        NavigationLink(value: category) {
                            CategoryCardComponentView(category: category)
                        }
                            
                    }
                    .navigationTitle("Categories")
                    .padding(.vertical)
                    .border(Color.black)
                    
                }
                .navigationDestination(for: Category.self) { category in
                    ProductsView(category: category.name)
                }
                .padding(20)
            }
        }
    }
}

#Preview {
    CategoriesView()
        .environmentObject(MainViewModel())
}
