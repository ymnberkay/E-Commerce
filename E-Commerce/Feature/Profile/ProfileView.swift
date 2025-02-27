//
//  ProfileView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 21.02.2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    var body: some View {
        VStack {
            NavigationTopBarView()
            ListView(viewModel: viewModel)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel())
}

private struct NavigationTopBarView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        HStack {
            Button(action: {dismiss()}, label: {
                Image("arrow-left")
            })
            Spacer()
            Text("Profile")
            Spacer()
            
            
        }.padding()
    }
}

private struct ListView: View {
    @StateObject var viewModel: ProfileViewModel
    var body: some View {
        List {
            HStack {
                Image("placeholderhp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 40)
                VStack {
                    Text("asd")
                    Text("asd")
                    
                }
            }
            Section(header: Text("General")) {
                
                Button {
                    
                } label: {
                    Text("Edit profile")
                }.buttonStyle(PlainButtonStyle())
                Button {
                    
                } label: {
                    Text("Notification")
                }.buttonStyle(PlainButtonStyle())
                Button {
                    
                } label: {
                    Text("Wishlist")
                }.buttonStyle(PlainButtonStyle())
                
                
            }
            Section(header: Text("Legal")) {
                Button {
                    
                } label: {
                    Text("Term of Use")
                }.buttonStyle(PlainButtonStyle())
                
                Button {
                    
                } label: {
                    Text("Privacy Policy")
                }.buttonStyle(PlainButtonStyle())
                
                
                
            }
            Section(header: Text("Personal")) {
                Button {
                    
                } label: {
                    Text("Report a Bug")
                }.buttonStyle(PlainButtonStyle())
                Button {
                    viewModel.logOut()
                } label: {
                    Text("Logout")
                }.buttonStyle(PlainButtonStyle())
                
                
            }
            
        }
    }
}
