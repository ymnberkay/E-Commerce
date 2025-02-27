//
//  E_CommerceApp.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 26.10.2024.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}


@main
struct E_CommerceApp: App {
    
    @StateObject var homeViewModel =  HomeViewModel(service: ECommerceService())
    @StateObject var searchViewModel = SearchViewModel()
    @StateObject var exploreProductsViewModel = ExploreProductsViewModel()
    @StateObject var productDetailViewModel = ProductDetailViewModel(service: ECommerceService())
    @StateObject var purchasedProductViewModel = PurchasedProductsViewModel()
    @StateObject var profileViewModel = ProfileViewModel()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: homeViewModel, searchViewModel: searchViewModel, exploreProductsViewModel: exploreProductsViewModel, productDetailViewModel: productDetailViewModel, purchasedProductViewModel: purchasedProductViewModel, profileViewModel: profileViewModel)
        }
    }
}
