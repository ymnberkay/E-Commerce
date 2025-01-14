//
//  E_CommerceApp.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.10.2024.
//

import SwiftUI

@main
struct E_CommerceApp: App {
    
    @ObservedObject var viewModel = LoginViewModel()
    @StateObject var homeViewModel =  HomeViewModel(service: ECommerceService())
    @StateObject var searchViewModel = SearchViewModel()
    @StateObject var exploreProductsViewModel = ExploreProductsViewModel()
    @StateObject var productDetailViewModel = ProductDetailViewModel(service: ECommerceService())
    @StateObject var purchasedProductViewModel = PurchasedProductsViewModel()
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: viewModel,homeViewModel: homeViewModel, searchViewModel: searchViewModel, exploreProductsViewModel: exploreProductsViewModel, productDetailViewModel: productDetailViewModel, purchasedProductViewModel: purchasedProductViewModel)
        }
    }
}
