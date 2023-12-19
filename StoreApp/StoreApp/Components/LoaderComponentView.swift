//
//  LoaderComponentView.swift
//  StoreApp
//
//  Created by Levan Loladze on 19.12.23.
//

import SwiftUI

struct LoaderView: View {
    // MARK: - Body
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .foregroundColor(.green)
            .cornerRadius(10)
            .padding()
    }
}
