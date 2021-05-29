//
//  MoyaApi.swift
//  MesanApplication
//
//  Created by galiev nail on 11.05.2021.
//

import Foundation
import Moya

enum MoyaApi {
    case signIn(email: String, password: String)
}

extension MoyaApi: TargetType {
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        return URL(string: BaseUrl.url)!
    }
    
    var path: String {
        return "/signInToken"
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case let .signIn(email, password):
            let userData = ["email": email, "password": password]
            return .requestParameters(parameters: userData, encoding: JSONEncoding.default)
        }
    }
}
