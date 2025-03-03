//
//  HomeView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 28.10.2024.
//

import SwiftUI


struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @StateObject var searchViewModel: SearchViewModel
    @StateObject var exploreProductsViewModel: ExploreProductsViewModel
    @StateObject var productDetailViewModel: ProductDetailViewModel
    @StateObject var purchasedProductViewModel: PurchasedProductsViewModel
    @StateObject var profileViewModel: ProfileViewModel
    
    
    var body: some View {
        VStack(spacing: -10) {
            TopView(viewModel: viewModel)
            VStack(spacing: -20) {
                HStack {
                    Text("Hi, \(profileViewModel.name ?? "Berkay")")
                        .font(.customFont(size: FontSizes.headline))
                    Spacer()
                }.padding()
                
                HStack {
                    Text("What are you looking for today?")
                        .font(.customFont(size: FontSizes.title1))
                        .bold()
                    Spacer()
                }
                .padding()
                
               
            }
            InputText(title: "Search headphone", opacity: 0.5, action: {
                viewModel.navigate(to: .search)
            })
            .padding()
            
            ZStack {
                RoundedRectangle(cornerRadius: 30).opacity(0.1)
                VStack(spacing: -5) {
                    CategoryList()
                    ScrollHorizontalView(viewModel: viewModel)
                    SeeAllView(viewModel: viewModel)
                    ScrollSmallHorizontalView(viewModel: viewModel)
                }
                
            }
        }.onAppear(perform: {
            Task {
                await viewModel.fetchProducts()
            }
            profileViewModel.fetchUserData()
            viewModel.isPresented = false
        })
        
        .navigationDestination(isPresented: $viewModel.isPresented) {
            if let destination = viewModel.selectedDestination {
                switch destination {
                case .search:
                    SearchView(viewModel: searchViewModel, purchasedProductViewModel: purchasedProductViewModel, itemDetail: viewModel.items)
                case .profile:
                    ProfileView(viewModel: profileViewModel)
                case .settings:
                    SearchView(viewModel: searchViewModel, purchasedProductViewModel: purchasedProductViewModel, itemDetail: viewModel.items)
                case .help:
                    SearchView(viewModel: searchViewModel, purchasedProductViewModel: purchasedProductViewModel, itemDetail: viewModel.items)
                case .seeAll:
                    ExploreProductsView(viewModel: exploreProductsViewModel, purchasedProductViewModel: purchasedProductViewModel, itemDetail: viewModel.items)
                case .detail:
                    ProductDetailView(viewModel: productDetailViewModel, purchasedProductViewModel: purchasedProductViewModel)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
}



#Preview {
    HomeView(viewModel: HomeViewModel(service: ECommerceService()), searchViewModel: SearchViewModel(), exploreProductsViewModel: ExploreProductsViewModel(), productDetailViewModel: ProductDetailViewModel(service: ECommerceService()), purchasedProductViewModel: PurchasedProductsViewModel(), profileViewModel: ProfileViewModel())
}
//MARK: -UI

struct TopView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        HStack {
            Button(action: { viewModel.navigate(to: .profile) }, label: {
                Image("menu")
            })
            Spacer()
            Image("logo")
            Spacer()
            Image("placeholderhp")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .background(Circle()
                    .stroke(lineWidth: 1.0))
            
        }.padding()
    }
}


struct ScrollHorizontalView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.items.indices, id: \.self) { index in
                    Banner(items: viewModel.items, index: index, action: {
                        viewModel.navigate(to: .detail)
                    }, isLoading: viewModel.isLoading)
                    
                }
                .frame(height: 178)
            }
            .padding()
        }
    }
}

struct SeeAllView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        HStack {
            Text("Featured Products")
                .font(.customFont(size: FontSizes.headline))
            Spacer()
            Button(action: {
                viewModel.navigate(to: .seeAll)
            }, label: {
                Text("See all")
                    .font(.customFont(size: FontSizes.headline))
                    .foregroundColor(.gray)
            })
        }.padding()
    }
}

struct ScrollSmallHorizontalView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.items.indices, id: \.self) { index in
                    SmallBanner(items: viewModel.items, index: index, price: 350)
                    
                }
                .frame(height: 178)
            }
            .padding()
        }
    }
}
