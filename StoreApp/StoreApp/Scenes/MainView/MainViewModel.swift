//
//  MainViewModel.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import SwiftUI
import NetworkingPackageGeneric



struct CartItem {
    let productName: String
    var quantity: Int
}


class MainViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var cartItems: [CartItem] = []
    @Published var categories: [Category] = []
    @Published var balance: Int = 1121
    
    @Published var isPurchaseInProgress = false
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var alertType: AlertType = .success
    
    var canBuy: Bool = false
    
    var totalItems: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }
    
    var totalPrice: Int {
        cartItems.reduce(0) { result, cartItem in
            if let product = products.first(where: { $0.title == cartItem.productName }) {
                return result + (product.price * cartItem.quantity)
            }
            return result
        }
    }
    
    init() {
        fetchProducts()
    }
    
    // MARK: - Network Call
    func fetchProducts() {
        let urlString = "https://dummyjson.com/products"
        
        NetworkManager.fetchData(from: urlString, modelType: ProductsModel.self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.products = data.products
                    self.extractCategories()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Add Product
    func addProduct(for product: Product) {
        if let index = cartItems.firstIndex(where: { $0.productName == product.title }) {
            cartItems[index].quantity += 1
            
        } else {
            let newCartItem = CartItem(productName: product.title, quantity: 1)
            cartItems.append(newCartItem)
        }
        
        if let productIndex = products.firstIndex(where: { $0.id == product.id }) {
            products[productIndex].stock -= 1
        }
    }
    
    // MARK: - Decrement Product
    func decrementProduct(for product: Product) {
        if let index = cartItems.firstIndex(where: { $0.productName == product.title }) {
            cartItems[index].quantity -= 1
            if cartItems[index].quantity <= 0 {
                cartItems.remove(at: index)
            }
        }
        
        if let productIndex = products.firstIndex(where: { $0.id == product.id }) {
            products[productIndex].stock += 1
        }
    }
    
    // MARK: - Disable Decrement Button
    func isDecrementButtonEnabled(for product: Product) -> Bool {
        if let cartIndex = cartItems.firstIndex(where: { $0.productName == product.title }) {
            return cartItems[cartIndex].quantity > 0
        }
        return false
    }
    
    // MARK: - Checkout Func
    func checkOut() {
        guard balance >= totalPrice else {
            showAlert(message: "Not enough balance to purchase this item.", type: .error)
            return
        }
        
        isPurchaseInProgress = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isPurchaseInProgress = false
            self.balance -= self.totalPrice
            self.showAlert(message: "Purchase successful!", type: .success)
        }
    }
    
    private func showAlert(message: String, type: AlertType) {
        alertMessage = message
        alertType = type
        showAlert = true
    }
    
    enum AlertType {
        case success, error
    }
    
    
    func extractCategories() {
        let categorySet = Set(products.map { $0.category })
        categories = categorySet.map { Category(name: $0) }
    }
    
}
