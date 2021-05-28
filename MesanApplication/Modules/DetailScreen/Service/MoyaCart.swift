//
//  MoyaCart.swift
//  MesanApplication
//
//  Created by galiev nail on 23.05.2021.
//

import Foundation
import Moya

enum MoyaCart {
    case addToCart(productId: Int)
}

extension MoyaCart: TargetType {
    
    var headers: [String: String]? {
        [:]
//        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
         Data()
    }
    
    var baseURL: URL {
        return URL(string: "http://localhost:8345")!
    }
    
    var path: String {
        return "/basket/add"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case let .addToCart(productId):
            let userData = ["productId": productId]
            return .requestParameters(parameters: userData, encoding: JSONEncoding.default)
        }
    }
}
