//
//  ProductDetailView.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 5.11.2024.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel: ProductDetailViewModel
    var body: some View {
        VStack {
            NavigationTopBarView()
            HStack {
                Text("200 USD")
                    .foregroundColor(.primaryColor)
                    .font(.customFont(size: FontSizes.headline))
                Spacer()
            }.padding(.horizontal)
            HStack {
                Text("TMA Wireless")
                    .font(.customFont(size: FontSizes.title1))
                Spacer()
            }.padding(.horizontal)
            
            ProductOptionView(viewModel: viewModel)
            
            if viewModel.selectedOption == 0 {
                OverviewView(viewModel: viewModel)
            } else if viewModel.selectedOption == 1 {
                FeaturesView(viewModel: viewModel)
            } else if viewModel.selectedOption == 2 {
                Spacer()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel())
}

private struct NavigationTopBarView: View {@Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack {
            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                Image("arrow-left")
            })
            Spacer()
            Button(action: {}, label: {
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
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(viewModel.productImages, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 281, height: 391)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                }
                HStack {
                    Text("Review (102)")
                        .font(.customFont(size: FontSizes.headline))
                    Spacer()
                }.padding(.horizontal)
                
                VStack {
                    ForEach(0..<3, id: \.self) { index in
                        Review(images: "Ellipse 10", userName: "Madelina", filledStars: 3, reviewText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
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
                        ForEach(viewModel.products) { product in
                            VStack {
                                Image("placeholderhp") // Bu resimlerin assetlerinizde mevcut olması gerekiyor
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                
                                Text(product.name)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                
                                Text(product.price)
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
                    
                })
            }
        }
        
    }
}

private struct FeaturesView: View {
    @StateObject var viewModel: ProductDetailViewModel
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
