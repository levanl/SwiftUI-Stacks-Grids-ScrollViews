//
//  StoreAppApp.swift
//  StoreApp
//
//  Created by Levan Loladze on 17.12.23.
//

import SwiftUI

@main
struct StoreAppApp: App {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
