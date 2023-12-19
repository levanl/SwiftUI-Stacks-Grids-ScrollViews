//
//  MainView.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Body
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Main")
                }
            
            CategoriesView()
                .tabItem {
                    Image(systemName: "menucard")
                    Text("Categories")
                }
        }
    }
}

struct HomeView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: MainViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    // MARK: - Body
    var body: some View {
        VStack {
            
            topBarView()
            
            Divider()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.products) { product in
                        ProductCardComponentView(product: product)
                    }
                    .padding()
                }
                .padding(20)
            }
            
            HStack {
                AlertCheckoutComponentView()
            }
            .padding(.horizontal)
            
        }
        .padding(.vertical)
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
}
