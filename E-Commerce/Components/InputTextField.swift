//
//  InputTextField.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 30.10.2024.
//


import SwiftUI

struct InputTextField: View {
    @State var textInput: String
    var opacity: Double
    
    
    var body: some View {
            HStack(spacing: 20) {
                Image("search1")
                TextField("Input Text", text: $textInput)
                    .textFieldStyle(PlainTextFieldStyle())
                    .autocorrectionDisabled()
            }
            .padding()
            .frame(width: 350)
            .background(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1.0))
            .opacity(opacity)
    }
}

#Preview {
    InputTextField(textInput: "", opacity: 1.0)
}
