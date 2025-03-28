//
//  SignupView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.10.2024.
//

import SwiftUI

struct SignupView: View {
    
    
    @StateObject var viewModel: SignupViewModel = SignupViewModel()
    @StateObject var homeViewModel: HomeViewModel
    @StateObject var searchViewModel: SearchViewModel
    @StateObject var exploreProductsViewModel: ExploreProductsViewModel
    @StateObject var productDetailViewModel: ProductDetailViewModel
    @StateObject var purchasedProductViewModel: PurchasedProductsViewModel
    @StateObject var profileViewModel: ProfileViewModel
    var body: some View {
        ZStack {
            Image("mainImage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                Spacer()
                topView()
                Spacer()
                EmailView(viewModel: viewModel)
                PasswordView(viewModel: viewModel)
                PrimaryButton(title: "Sign Up", action: {
                    viewModel.createUserFirebase(email: viewModel.emailValue, password: viewModel.passwordValue)
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
                
                BottomView()
                Spacer()
            }
        }.navigationDestination(isPresented: $viewModel.isSignup) {
            HomeView(viewModel: homeViewModel, searchViewModel: searchViewModel, exploreProductsViewModel: exploreProductsViewModel, productDetailViewModel: productDetailViewModel, purchasedProductViewModel: purchasedProductViewModel, profileViewModel: profileViewModel)
        }
        .onChange(of: viewModel.isSignup) { newValue in
            print("isSignup değişti: \(newValue)")
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    SignupView(viewModel: SignupViewModel(),homeViewModel: HomeViewModel(service: ECommerceService()),searchViewModel: SearchViewModel(), exploreProductsViewModel: ExploreProductsViewModel(), productDetailViewModel: ProductDetailViewModel(service: ECommerceService()), purchasedProductViewModel: PurchasedProductsViewModel(), profileViewModel: ProfileViewModel())
}

private struct PasswordView: View {
    @StateObject var viewModel: SignupViewModel
    var body: some View {
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
    }
}

struct EmailView: View {
    @StateObject var viewModel: SignupViewModel
    var body: some View {
        HStack{
            Image("mail")
                .opacity(0.5)
            TextField("Email", text: $viewModel.emailValue)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(.gray)
                .font(.customFont(size: FontSizes.caption1))
                .padding(.leading, 8)
                .autocapitalization(.none)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal,10)
    }
}

private struct BottomView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
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
    }
}

private struct topView: View {
    var body: some View {
        Text("Audio")
            .font(.customFont(size: FontSizes.largeTitle))
            .foregroundColor(.white)
        Text("It's modular and designed to last")
            .font(.customFont(size: FontSizes.caption1))
            .foregroundColor(.white)
    }
}
