//
//  SignupViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 28.10.2024.
//

import Foundation
import FirebaseAuth
import SwiftUI

final class SignupViewModel: ObservableObject {
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    @Published var emailValue: String = ""
    @Published var passwordValue: String = ""
    @Published var isSignup: Bool = false
    @Published var errorMessage: String?
    
    func createUserFirebase(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                print(self.errorMessage)
            } else {
                DispatchQueue.main.async {
                    self.isSignup = true
                    self.isUserLoggedIn = true
                    print(self.isSignup)
                }
            }
            
        }
        
    }
}
