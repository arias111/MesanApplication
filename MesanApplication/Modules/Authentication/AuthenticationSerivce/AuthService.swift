//
//  AuthService.swift
//  MesanApplication
//
//  Created by galiev nail on 10.05.2021.
//

import Foundation
import Moya
import SwiftKeychainWrapper
import JWTDecode

enum MyCustomError: Error {
    case notFound
    case badUrl
    case unknown(error: Error)
    case unauthorized
    case commonError
}

class AuthService: AuthServiceProtocol {
    let provider = MoyaProvider<MoyaApi>()

    func signInWithUrlSession(email: String, password: String, completion: @escaping (Result<TokenResponse, Error>) -> Void) {

        guard let url = URL(string: BaseUrl.url + "/signInToken") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let userData = ["email": email, "password": password]
        let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: [])
        request.httpBody = httpBody
        let decoder = JSONDecoder()

        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard response != nil, let data = data
            else { return }
            do {
                let tokenResponse = try decoder.decode(TokenResponse.self, from: data)
                let accessToken = tokenResponse.token
                let saveToken: Bool = KeychainWrapper.standard.set(accessToken, forKey: "accessToken")
//                let userId: Bool = KeychainWrapper.standard.set(user!, forKey: "userId")
                print("Did token saved? \(saveToken)")
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
        provider.request(.signIn(email: email, password: password)) { result in
            switch result {
            case let .success(moyaResponse):
                guard (200...299).contains(moyaResponse.statusCode)
                else {
                  return
                }
                do {
                    let tokenResponse = try moyaResponse.map(TokenResponse.self)
                    let accessToken = tokenResponse.token
                    let saveToken: Bool = KeychainWrapper.standard.set(accessToken, forKey: "accessToken")
                    let jwt = try decode(jwt: accessToken)
                    let claim = jwt.claim(name: "email")
                    if let email = claim.string {
                        print("Email in jwt was \(email)")
                        let saveEmail: Bool = KeychainWrapper.standard.set(accessToken, forKey: "email")
                    }
                    print("Did token saved? \(saveToken)")

                    completion(.success(tokenResponse))
                } catch {
                    completion(.failure(error))
                }

            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
