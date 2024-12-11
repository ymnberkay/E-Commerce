//
//  LoginView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.10.2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject  var viewModel: LoginViewModel
    @StateObject var homeViewModel: HomeViewModel
    @StateObject var searchViewModel: SearchViewModel
    @StateObject var exploreProductsViewModel: ExploreProductsViewModel
    @StateObject var productDetailViewModel: ProductDetailViewModel
    
    var body: some View {
        NavigationStack {
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
                            .foregroundColor(.gray)
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
                    
                    Button(action: {}, label: {
                        Text("Forgot Password")
                            .font(.customFont(size: FontSizes.caption1))
                            .foregroundColor(.white)
                    })
                    .padding(.vertical,0)
                    PrimaryButton(title: "Sign In", action: {
                        viewModel.isLoggedIn = true
                        viewModel.login(username: viewModel.emailValue, password: viewModel.passwordValue)
                    })
                    .padding(.vertical,0)
                    HStack(spacing: 0) {
                        Text("Didn’t have any account? ")
                            .font(.customFont(size: FontSizes.caption1))
                            .foregroundColor(.white)
                        Text("Sign Up here")
                            .font(.customFont(size: FontSizes.caption1))
                            .foregroundColor(.primaryColor)
                            .underline()
                            .onTapGesture {
                                viewModel.isLoggedIn = true
                            }
                    }
                    .padding(.top,20)
                    Spacer()
                    
                    
                }
            }
            .navigationDestination(isPresented: $viewModel.isLoggedIn){
                SignupView(homeViewModel: homeViewModel, searchViewModel: searchViewModel,exploreProductsViewModel: exploreProductsViewModel,productDetailViewModel: productDetailViewModel)
            }
        }.onAppear(perform: {
            viewModel.isLoggedIn = false
            print("login view appeared")
        })
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(), homeViewModel: HomeViewModel(service: ECommerceService()), searchViewModel: SearchViewModel(), exploreProductsViewModel: ExploreProductsViewModel(), productDetailViewModel: ProductDetailViewModel())
}
