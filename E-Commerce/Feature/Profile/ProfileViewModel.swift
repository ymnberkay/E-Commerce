//
//  ProfileViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.02.2025.
//

import Foundation
import SwiftUI
import FirebaseAuth

final class ProfileViewModel: ObservableObject {
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    @Published var email: String?
    @Published var name: String?
    @Published var surname: String?
    @Published var wishList: [ItemDetail]?
    @Published var currentUser: FirebaseAuth.User?
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                self.isUserLoggedIn = false
                print("\(Auth.auth().currentUser) logout")
            }
        } catch {
            print("Logout fail")
        }
    }
    
    func getCurrentUser() {
        currentUser = Auth.auth().currentUser
        self.email = currentUser?.email
    }
    
    
    func editName() {
        
    }
    
    func addWishList() {
        
    }
    
    func editProfilePic() {
        
    }
}
