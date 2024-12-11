//
//  HomeViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 28.10.2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var selectedDestination: Destination?
    @Published var isPresented: Bool = false
    @Published var userName: String?
    @Published var userImage: String?
    @Published var items: [ItemDetail] = []
    @Published var isLoading: Bool = false
    private let service: IECommerceService
    
    init(service: IECommerceService) {
        self.service = service
    }
    
    func navigate(to destination: Destination) {
        self.selectedDestination = destination
        self.isPresented = true
    }
    
    
    func fetchProducts() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        defer {
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
        
        if let fetchedProducts = await service.fetchAllPageData(path: "/e18004c6-a6fc-46ca-82db-ea1b5cb1f2dc", method: .get, type: Items.self) {
            DispatchQueue.main.async {
                self.items = fetchedProducts.products ?? []
            }
            
        } else {
            print("Failed to fetch products")
        }
    }
    
}
