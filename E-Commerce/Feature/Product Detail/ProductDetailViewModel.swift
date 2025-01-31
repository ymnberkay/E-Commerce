//
//  ProductDetailViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 5.11.2024.
//

import Foundation

final class ProductDetailViewModel: ObservableObject {
    @Published  var selectedOption: Int = 0
    let options = ["Overview", "Features", "Specification"]
    @Published var productDetail: ProductDetail?
    @Published var isLoading: Bool = false
    @Published var navigateToShopping: Bool = false
    private let service: IECommerceService
    
    init(service: IECommerceService) {
        self.service = service
    }
    
    func fetchDetailData() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        if let fetcedDetails =  await service.fetchAllPageData(path: "/35c80431-8f5b-4128-8dc0-cc921e35eaf3", method: .get, type: ProductDetail.self) {
            DispatchQueue.main.async {
                self.productDetail = fetcedDetails
            }
        } else {
            print("Failed to fetch products")
        }
    }
    
}


