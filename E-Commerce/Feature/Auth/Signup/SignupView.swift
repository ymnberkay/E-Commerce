//
//  SignupView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.10.2024.
//

import SwiftUI

struct SignupView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject  var viewModel: SignupViewModel = SignupViewModel()
    @StateObject var homeViewModel: HomeViewModel
    @StateObject var searchViewModel: SearchViewModel
    
    
    var body: some View {
        ZStack {
            Image("mainImage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                Spacer()
                Text("Audio")
                    .font(.customFont(size: FontSizes.largeTitle))
                    .foregroundColor(.white)
                Text("It's modular and designed to last")
                    .font(.customFont(size: FontSizes.caption1))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack{
                    Image("mail")
                        .opacity(0.5)
                    TextField("Email", text: $viewModel.emailValue)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(.gray)
                        .font(.customFont(size: FontSizes.caption1))
                        .padding(.leading, 8)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal,10)
                
                HStack{
                    Image("lock")
                        .opacity(0.5)
                    SecureField("Password", text: $viewModel.passwordValue)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(.gray)
                        .font(.customFont(size: FontSizes.caption1))
                        .padding(.leading, 8)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal,10)
                .padding(.vertical,20)
                
                PrimaryButton(title: "Sign Up", action: {
                    viewModel.isLoggedIn = true
                })
                .padding(.vertical,0)
                
                HStack(spacing: 15) {
                    AuthButton(image: "apple") {
                        
                    }
                    AuthButton(image: "facebook") {
                        
                    }
                    AuthButton(image: "search") {
                        
                    }
                }
                
                HStack(spacing: 0) {
                    Text("If you have an account? ")
                        .font(.customFont(size: FontSizes.caption1))
                        .foregroundColor(.white)
                    Text("Sign In here")
                        .font(.customFont(size: FontSizes.caption1))
                        .foregroundColor(.primaryColor)
                        .underline()
                        .onTapGesture {
                            dismiss()
                        }
                }
                .padding(.top,20)
                Spacer()
                
                
            }
        }.navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
                HomeView(viewModel: homeViewModel, searchViewModel: searchViewModel)
            }
        
    }
}



#Preview {
    SignupView(viewModel: SignupViewModel(),homeViewModel: HomeViewModel(),searchViewModel: SearchViewModel())
}
