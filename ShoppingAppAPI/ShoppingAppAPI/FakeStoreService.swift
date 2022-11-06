//
//  FakeStoreService.swift
//  ShoppingAppAPI
//
//  Created by Barkın Süngü on 2.11.2022.
//

import Foundation
import Moya

public let fakeStoreServiceProvider = MoyaProvider<FakeStoreService>()

public enum FakeStoreService {
    case getProducts
    case getProduct(id: Int)
}

extension FakeStoreService: TargetType{
    public var baseURL: URL {
        return URL(string: "https://fakestoreapi.com")!
    }
    
    public var path: String {
        switch self{
        case .getProducts:
            return "/products"
        case .getProduct(id: let id):
            return "/products/\(id)"
        }
    }
    
    public var method: Moya.Method {
        .get
    }
    
    public var task: Moya.Task {
        switch self{
        case .getProducts:
            return .requestPlain
        case .getProduct(id: let id):
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        nil
    }
    
    
}
