//
//  MainView.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        VStack {
            Text("Balance: ₾\(viewModel.balance)")
                .font(.system(size: 20))
            Text("Items: \(viewModel.totalItems)")
                .font(.system(size: 20))
            Text("Total: ₾\(viewModel.totalPrice)")
                .font(.system(size: 20))
            
            Divider()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.products) { product in
                        ProductCardComponentView(product: product)
                    }
                    .padding()
                    .border(Color.black)
                }
                .padding(20)
            }
            
            HStack {
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
            .padding(.horizontal)
            
        }
        .padding(.vertical)
    }
}


struct MainView: View {
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



#Preview {
    MainView()
        .environmentObject(MainViewModel())
}


struct LoaderView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .foregroundColor(.green)
            .cornerRadius(10)
            .padding()
    }
}
