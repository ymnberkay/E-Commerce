//
//  SearchViewModel.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 30.10.2024.
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var navigateToShopping: Bool = false
    
}
