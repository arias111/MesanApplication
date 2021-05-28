//
//  AuthProtocols.swift
//  MesanApplication
//
//  Created by galiev nail on 10.05.2021.
//

import Foundation

protocol AuthServiceProtocol {
    func signIn(email: String, password: String, completion: @escaping (Result<TokenResponse, Error>) -> Void)
    func signInWithUrlSession(email: String, password: String, completion: @escaping (Result<TokenResponse, Error>) -> Void)
}
