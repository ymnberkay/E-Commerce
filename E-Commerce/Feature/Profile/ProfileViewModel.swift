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
    @AppStorage("isUserLoggedIn") private var isUserLoggedIn: Bool = false
    
    func logOut() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                self.isUserLoggedIn = false
            }
        } catch {
            print("Logout fail")
        }
        
        
        
    }
}
