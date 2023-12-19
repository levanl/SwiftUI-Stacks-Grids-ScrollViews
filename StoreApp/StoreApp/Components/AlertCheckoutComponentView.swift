//
//  AlertCheckoutComponentView.swift
//  StoreApp
//
//  Created by Levan Loladze on 19.12.23.
//

import SwiftUI

struct AlertCheckoutComponentView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: MainViewModel
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            viewModel.checkOut()
        }) {
            if viewModel.isPurchaseInProgress {
                
                LoaderView()
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.green)
                    .cornerRadius(10)
            } else {
                Text("Checkout")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.headline)
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
        .background(.green)
        .cornerRadius(10)
        .alert(isPresented: $viewModel.showAlert) {
            switch viewModel.alertType {
            case .success:
                return Alert(title: Text("Success"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            case .error:
                return Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

