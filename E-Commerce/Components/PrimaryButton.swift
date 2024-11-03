//
//  PrimaryButton.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.10.2024.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .font(.customFont(size: FontSizes.headline))
                .background(Color.primaryColor)
                .foregroundColor(.white)
                .cornerRadius(10)
            
        }.padding()
    }
}

#Preview {
    PrimaryButton(title: "Deneme", action:{})
}
