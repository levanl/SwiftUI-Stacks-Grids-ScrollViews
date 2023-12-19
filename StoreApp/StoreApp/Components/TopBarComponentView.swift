//
//  TopBarComponentView.swift
//  StoreApp
//
//  Created by Levan Loladze on 19.12.23.
//

import SwiftUI

struct topBarView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: MainViewModel
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text("Bal: ₾\(viewModel.balance)")
            
            Spacer()
            
            Text("Total: ₾\(viewModel.totalPrice)")
            
            Spacer()
            
            Image(systemName: "cart.fill")
                .foregroundColor(.blue)
            Text("Cart (\(viewModel.totalItems))")
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
    }
}
