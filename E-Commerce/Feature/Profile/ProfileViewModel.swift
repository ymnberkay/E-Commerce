//
//  ProfileViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.02.2025.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

final class ProfileViewModel: ObservableObject {
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false
    @Published var email: String?
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var wishList: [ItemDetail]?
    @Published var currentUser: FirebaseAuth.User?
    @Published var showEditProfile: Bool = false
    
    let db = Firestore.firestore()
    
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
    
    
    func editName(name: String, surname: String) {
        db.collection("users").document(currentUser?.uid ?? "").setData(["name" : name, "surname": surname], merge: true) { error in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                self.name = name
                self.surname = surname
            }
            
        }
    }
    
    func fetchUserData() {
        guard let uid = Auth.auth().currentUser?.uid, !uid.isEmpty else {
               return
           }
           
        let userRef = db.collection("users").document(uid)
        
        userRef.getDocument { document, error in
            if let error = error {
                print("\(error.localizedDescription)")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                self.name = data?["name"] as? String ?? ""
                self.surname = data?["surname"] as? String ?? ""
                self.email = data?["email"] as? String ?? ""
                
            } else {
                
            }
        }
    }
    
    func addWishList() {
        
    }
    
    func editProfilePic() {
        
    }
}
