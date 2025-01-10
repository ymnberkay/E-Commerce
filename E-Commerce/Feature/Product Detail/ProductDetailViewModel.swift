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
    private let service: IECommerceService
    
    init(service: IECommerceService) {
        self.service = service
    }
    
    func fetchDetailData() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        if let fetcedDetails =  await service.fetchAllPageData(path: "/b6a15ba9-e766-4439-8559-610da7aca51b", method: .get, type: ProductDetail.self) {
            DispatchQueue.main.async {
                self.productDetail = fetcedDetails
            }
        } else {
            print("Failed to fetch products")
        }
    }
    
}


