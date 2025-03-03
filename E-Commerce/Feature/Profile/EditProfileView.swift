//
//  EditProfileView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 3.03.2025.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Name: ")
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.gray)
                    .font(.customFont(size: FontSizes.caption1))
                    .padding(.leading, 8)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
            }.padding()
            HStack {
                Text("Surname: ")
                TextField("Surname", text: $viewModel.surname)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.gray)
                    .font(.customFont(size: FontSizes.caption1))
                    .padding(.leading, 8)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
            }.padding()
           
            PrimaryButton(title: "Apply", action: {
                viewModel.editName(name: viewModel.name, surname: viewModel.surname)
            })
        }
    }
}

#Preview {
    EditProfileView(viewModel: ProfileViewModel())
}
