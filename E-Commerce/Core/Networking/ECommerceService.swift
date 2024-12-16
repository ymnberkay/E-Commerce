//
//  ECommerceService.swift
//  E-Commerce
//
//  Created by Berkay Yaman on 11.12.2024.
// https://run.mocky.io/v3/e18004c6-a6fc-46ca-82db-ea1b5cb1f2dc

//  /2184f040-f039-4a69-a619-479b8b0c00f1

import Alamofire

protocol IECommerceService {
    func fetchAllPageData<T: Codable>(path: String, method: HTTPMethod, type: T.Type) async -> T?
}

class ECommerceService: IECommerceService {
    let baseURL = "https://run.mocky.io/v3"
    func fetchAllPageData<T: Codable>(path: String, method: Alamofire.HTTPMethod, type: T.Type) async -> T? {
        let dataRequest = AF.request("\(baseURL)\(path)", method: method)
            .validate()
            .serializingDecodable(T.self)
        
        let result = await dataRequest.response
        
        guard let value = result.value else {
            print("Erorr: \(String(describing: result.error))")
            return nil
        }

        return value
    }
}
