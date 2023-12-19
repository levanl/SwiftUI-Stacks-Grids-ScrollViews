//
//  CategoryCardComponentView.swift
//  StoreApp
//
//  Created by Levan Loladze on 18.12.23.
//

import SwiftUI

struct CategoryCardComponentView: View {
    
    // MARK: - Properties
    let category: Category
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Image("phones")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .clipped()
            
            Text(category.name)
                .font(.headline)
                .padding(.top, 8)
                .foregroundColor(.primary)
        }
        .padding(8)
    }
}


#Preview {
    CategoryCardComponentView(category: Category(name: "Phones"))
        .environmentObject(MainViewModel())
    
}
