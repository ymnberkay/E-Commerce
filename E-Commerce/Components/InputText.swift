//
//  InputText.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 28.10.2024.
//

import SwiftUI

struct InputText: View {
    var title: String
    var opacity: Double
    var action: () -> Void
    
    
    var body: some View {
        Button(action: action, label: {
            HStack(spacing: 30) {
                Image("search1")
                Text(title)
                    .font(.customFont(size: FontSizes.caption1))
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()
            .frame(width: 350)
            .background(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1.0))
            .opacity(opacity)
        })
        

    }
}

#Preview {
    InputText(title: "Input Text", opacity: 1.0, action: {})
}
