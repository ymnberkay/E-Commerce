//
//  ProductDetailView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 5.11.2024.
//

import SwiftUI
import Kingfisher

struct ProductDetailView: View {
    @StateObject var viewModel: ProductDetailViewModel
    @StateObject var purchasedProductViewModel: PurchasedProductsViewModel
    var body: some View {
        VStack {
            NavigationTopBarView( viewModel: viewModel)
            HStack {
                Text("\(String(describing: viewModel.productDetail?.product.price ?? 0.0)) USD")
                    .foregroundColor(.primaryColor)
                    .font(.customFont(size: FontSizes.headline))
                Spacer()
            }.padding(.horizontal)
            HStack {
                Text(viewModel.productDetail?.product.name ?? "")
                    .font(.customFont(size: FontSizes.title1))
                Spacer()
            }.padding(.horizontal)
            
            ProductOptionView(viewModel: viewModel)
            
            if viewModel.selectedOption == 0 {
                OverviewView(viewModel: viewModel, purchasedProductViewModel: purchasedProductViewModel)
            } else if viewModel.selectedOption == 1 {
                FeaturesView(viewModel: viewModel, purchasedProductViewModel: purchasedProductViewModel)
            } else if viewModel.selectedOption == 2 {
                Spacer()
            }
        }.onAppear {
            viewModel.navigateToShopping = false
            Task {
                await viewModel.fetchDetailData()
                
            }
        }
        .navigationDestination(isPresented: $viewModel.navigateToShopping, destination: {
            ShoppingCartView(viewModel: purchasedProductViewModel)
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(service: ECommerceService()), purchasedProductViewModel: PurchasedProductsViewModel())
}

private struct NavigationTopBarView: View {@Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: ProductDetailViewModel
    var body: some View {
        HStack {
            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                Image("arrow-left")
            })
            Spacer()
            Button(action: {viewModel.navigateToShopping = true}, label: {
                Image("shopping-cart")
            })
            
        }.padding()
    }
}

private struct ProductOptionView: View {
    @StateObject var viewModel: ProductDetailViewModel
    var body: some View {
        HStack(spacing: 20) {
            ForEach(0..<viewModel.options.count, id: \.self) { index in
                VStack {
                    Text(viewModel.options[index])
                        .cornerRadius(8)
                        .onTapGesture {
                            viewModel.selectedOption = index
                        }
                        .font(.customFont(size: FontSizes.caption1))
                    Rectangle()
                        .fill(viewModel.selectedOption == index ? Color.green : Color.clear)
                        .frame(height: 4)
                        .cornerRadius(2)
                        .padding(.horizontal)
                }
                .padding()
            }
        }
    }
}

private struct OverviewView: View {
    @StateObject var viewModel: ProductDetailViewModel
    @StateObject var purchasedProductViewModel: PurchasedProductsViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(viewModel.productDetail?.product.images ?? [], id: \.self) { imageName in
                            KFImage(URL(string: imageName))
                                .placeholder{
                                    ProgressView()
                                }
                                .resizable()
                                .scaledToFit()
                                .frame(width: 281, height: 391)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
                HStack {
                    Text("Review (\(viewModel.productDetail?.product.views ?? 102))")
                        .font(.customFont(size: FontSizes.headline))
                    Spacer()
                }.padding(.horizontal)
                
                VStack {
                    ForEach(0..<3, id: \.self) { index in
                        Review(images: "Ellipse 10", userName: viewModel.productDetail?.product.reviews?[index].username ?? "", filledStars: Int(viewModel.productDetail?.product.reviews?[index].rating ?? 0), reviewText: viewModel.productDetail?.product.reviews?[index].comment ?? "")
                    }
                    .padding(.vertical)
                    Button(action: {}, label: {
                        Text("See all reviews")
                            .font(.customFont(size: FontSizes.headline))
                            .foregroundColor(.gray)
                    })
                }
                HStack {
                    Text("Another Product")
                    Spacer()
                    Button(action: { }, label: {
                        Text("See All")
                            .foregroundColor(.gray)
                    })
                }
                .padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(viewModel.productDetail?.product.relatedProducts ?? [], id: \.id) { product in
                            VStack {
                                KFImage(URL(string: product.image ?? "" ))
                                    .placeholder{
                                        ProgressView()
                                    }
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                
                                Text(product.name ?? "")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                
                                Text("\(String(describing: product.price))")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20)
                                .frame(width: 155, height: 213).foregroundColor(.white))
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
                PrimaryButton(title: "Add To Cart", action: {
                    purchasedProductViewModel.addItem(item: PurchasedItem(title: viewModel.productDetail?.product.name, price: viewModel.productDetail?.product.price, image: viewModel.productDetail?.product.images?[0], count: 1))
                    
                    print(purchasedProductViewModel.purchasedProductsList)
                })
            }
        }
        
    }
}

private struct FeaturesView: View {
    @StateObject var viewModel: ProductDetailViewModel
    @StateObject var purchasedProductViewModel: PurchasedProductsViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Highly Detailed Audio")
                    .font(.customFont(size: 16))
                Spacer()
            }.padding()
            
            HStack {
                Text("The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.\n\nThe speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers.")
                    .multilineTextAlignment(.leading)
                    .font(.customFont(size: 14))
                Spacer()
            }.padding()
            
            PrimaryButton(title: "Add To Cart", action: {
                
            })
            Spacer()
        }
    }
}
