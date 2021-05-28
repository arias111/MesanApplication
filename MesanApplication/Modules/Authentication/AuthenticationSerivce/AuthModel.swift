//
//  AuthModel.swift
//  MesanApplication
//
//  Created by galiev nail on 10.05.2021.
//

import Foundation

struct SignInRequest: Codable {
    let email: String
    let password: String
}

struct TokenResponse: Decodable {
    let token: String
}
