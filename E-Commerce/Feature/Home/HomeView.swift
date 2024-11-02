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
    var body: some View {
        VStack(spacing: -10) {
            TopView(viewModel: viewModel)
            VStack(spacing: -20) {
                HStack {
                    Text("Hi, Andrea")
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
                    SeeAllView()
                    ScrollSmallHorizontalView(viewModel: viewModel)
                }
                
            }
            
                
            
        }.navigationDestination(isPresented: $viewModel.isPresented) {
            if let destination = viewModel.selectedDestination {
                switch destination {
                case .search:
                    SearchView(viewModel: searchViewModel)
                case .profile:
                    SearchView(viewModel: searchViewModel)
                case .settings:
                    SearchView(viewModel: searchViewModel)
                case .help:
                    SearchView(viewModel: searchViewModel)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
}



#Preview {
    HomeView(viewModel: HomeViewModel(), searchViewModel: SearchViewModel())
}
//MARK: -UI

struct TopView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        HStack {
            Button(action: {viewModel.navigate(to: .profile)}, label: {
                Image("menu")
            })
            Spacer()
            Image("logo")
            Spacer()
            Image("asd")
                .background(Circle()
                    .stroke(lineWidth: 1.0)
                    .frame(width: 32, height: 32))
                .padding()
            
        }.padding()
    }
}


struct ScrollHorizontalView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.items.indices, id: \.self) { index in
                    Banner(items: viewModel.items, index: index)
                    
                }
                .frame(height: 178)
            }
            .padding()
        }
    }
}

struct SeeAllView: View {
    var body: some View {
        HStack {
            Text("Featured Products")
                .font(.customFont(size: FontSizes.headline))
            Spacer()
            Button(action: {
                
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
