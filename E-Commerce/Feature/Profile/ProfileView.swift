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
        .navigationDestination(isPresented: $viewModel.showEditProfile, destination: {
                EditProfileView(viewModel: viewModel)
            })
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
                .font(.customFont(size: FontSizes.caption1))
            Spacer()
            
            
        }.padding()
    }
}

private struct ListView: View {
    @StateObject var viewModel: ProfileViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        List {
            HStack {
                Image("placeholderhp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("\(viewModel.name ?? "Berkay") \(viewModel.surname ?? "YAMAN")")
                        .font(.customFont(size: FontSizes.caption1))
                    Text(viewModel.email ?? "ymnberkayy@gmail.com")
                        .opacity(0.5)
                        .font(.customFont(size: FontSizes.caption1))
                }
            }
            
            Section(header: Text("General").font(.customFont(size: FontSizes.caption1))) {
                
                Button {
                    viewModel.showEditProfile = true
                } label: {
                    Text("Edit profile")
                        .font(.customFont(size: FontSizes.caption1))
                }.buttonStyle(PlainButtonStyle())
                Button {
                    
                } label: {
                    Text("Notification")
                        .font(.customFont(size: FontSizes.caption1))
                }.buttonStyle(PlainButtonStyle())
                Button {
                    
                } label: {
                    Text("Wishlist")
                        .font(.customFont(size: FontSizes.caption1))
                }.buttonStyle(PlainButtonStyle())
                
                
            }
            Section(header: Text("Legal").font(.customFont(size: FontSizes.caption1))) {
                Button {
                    
                } label: {
                    Text("Term of Use")
                        .font(.customFont(size: FontSizes.caption1))
                }.buttonStyle(PlainButtonStyle())
                
                Button {
                    
                } label: {
                    Text("Privacy Policy")
                        .font(.customFont(size: FontSizes.caption1))
                }.buttonStyle(PlainButtonStyle())
                
                
                
            }
            Section(header: Text("Personal").font(.customFont(size: FontSizes.caption1))) {
                Button {
                    
                } label: {
                    Text("Report a Bug")
                        .font(.customFont(size: FontSizes.caption1))
                }.buttonStyle(PlainButtonStyle())
                
                Button {
                    viewModel.logOut()
                } label: {
                    Text("Logout")
                        .font(.customFont(size: FontSizes.caption1))
                }.buttonStyle(PlainButtonStyle())
                
                
            }
            
        }
        
        .onAppear {
            viewModel.getCurrentUser()
        }
        .onChange(of: viewModel.isUserLoggedIn) { oldValue, newValue in
            dismiss()
        }
    }
}
