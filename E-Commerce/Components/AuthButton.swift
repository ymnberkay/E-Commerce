//
//  AuthButton.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 28.10.2024.
//


import SwiftUI

struct AuthButton: View {
    var image: String
    var action: () -> Void
    var body: some View {
        Button(action: action, label: {
            Image(image)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.white)
                    .frame(width: 52, height: 52))
            
        })
    }
}

#Preview {
    AuthButton(image: "apple", action: {})
}
