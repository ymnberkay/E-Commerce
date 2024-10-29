//
//  SignupViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 28.10.2024.
//

import Foundation

final class SignupViewModel: ObservableObject {
    @Published var emailValue: String = ""
    @Published var passwordValue: String = ""
    @Published var isLoggedIn: Bool = false
}
