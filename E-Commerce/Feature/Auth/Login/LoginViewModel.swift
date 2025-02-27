//
//  LoginViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.10.2024.
//

import Foundation
import FirebaseAuth
import SwiftUI

final class LoginViewModel: ObservableObject {
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    @Published var emailValue: String = ""
    @Published var passwordValue: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var showSignUp: Bool = false
    @Published var errorMessage: String?
    @Published var selectedDestination: Destination?
    
    func loginFirebase(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                DispatchQueue.main.async {
                    print(authResult?.user ?? "")
                    self.isLoggedIn = true
                    self.isUserLoggedIn = true
                }
            }
        }
    }
    
}
