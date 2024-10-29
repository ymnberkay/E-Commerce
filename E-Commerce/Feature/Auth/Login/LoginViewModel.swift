//
//  LoginViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.10.2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var emailValue: String = ""
    @Published var passwordValue: String = ""
    @Published var isLoggedIn: Bool = false
    
    func login(username: String, password: String) {
           if username == "test" && password == "test123" {
               isLoggedIn = true
           }
       }
    
}
