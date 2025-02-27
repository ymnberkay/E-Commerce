//
//  ContentView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.10.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isUserLoggedIn") private var isUserLoggedIn: Bool = false
    
    @StateObject var viewModel: HomeViewModel
    @StateObject var searchViewModel: SearchViewModel
    @StateObject var exploreProductsViewModel: ExploreProductsViewModel
    @StateObject var productDetailViewModel: ProductDetailViewModel
    @StateObject var purchasedProductViewModel: PurchasedProductsViewModel
    @StateObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        
        NavigationStack {
            if isUserLoggedIn {
                HomeView(viewModel: viewModel, searchViewModel: searchViewModel, exploreProductsViewModel: exploreProductsViewModel, productDetailViewModel: productDetailViewModel, purchasedProductViewModel: purchasedProductViewModel, profileViewModel: profileViewModel)
            } else {
                LoginView(homeViewModel: viewModel, searchViewModel: searchViewModel, exploreProductsViewModel: exploreProductsViewModel, productDetailViewModel: productDetailViewModel, purchasedProductViewModel: purchasedProductViewModel, profileViewModel: profileViewModel)
            }
        }
    }
}

