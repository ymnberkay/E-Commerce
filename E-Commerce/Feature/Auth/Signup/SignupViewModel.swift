//
//  SignupViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 28.10.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

final class SignupViewModel: ObservableObject {
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    @Published var emailValue: String = ""
    @Published var passwordValue: String = ""
    @Published var isSignup: Bool = false
    @Published var errorMessage: String?
    
    let dbFirestore = Firestore.firestore()
    
    func createUserFirebase(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                print(self.errorMessage)
            } else {
                DispatchQueue.main.async {
                    guard let user = authResult?.user else {
                        return
                    }
                    self.isSignup = true
                    self.isUserLoggedIn = true
                    print(self.isSignup)
                    self.createUserFirestore(user: user)
                }
                
            }
            
        }
        
    }
    
    func createUserFirestore(user: FirebaseAuth.User) {
        let userData: [String: Any] = [
            "email": user.email ?? "",
            "createdAt": Timestamp()
        ]
        
        dbFirestore.collection("users").document(user.uid).setData(userData) { error in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print("\(user.uid)")
            }
        
        }
    }
}
