//
//  CartService.swift
//  MesanApplication
//
//  Created by galiev nail on 23.05.2021.
//

import Foundation
import Alamofire
import SwiftKeychainWrapper

class CartService: CartServiceProtocols {
    
    func checkoutCart(completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:8345/checkout")
        else { return }
        guard let retrievedString: String = KeychainWrapper.standard.string(forKey: "accessToken")
        else { return }
        
        let headers: HTTPHeaders = [
            "Auth": retrievedString
        ]
        
        AF.request(url, headers: headers).response { response in
            let statusCode = response.response?.statusCode
            if statusCode! < 300 {
                completion(.success(true))
            } else {
                completion(.failure((NSError(domain: "", code: 1, userInfo: nil))))
            }
        }
    }
    
    func loadCart(completion: @escaping (Result<[CartModel], Error>) -> Void) {
        guard let url = URL(string: "http://localhost:8345/basket")
        else { return }
        guard let retrievedString: String = KeychainWrapper.standard.string(forKey: "accessToken")
        else { return }
        
        let headers: HTTPHeaders = [
            "Auth": retrievedString,
            "Content-Type": "application/json"
        ]
        
        AF.request(url, headers: headers).responseJSON { response in
            guard let data = response.data
            else { return completion(.failure((NSError(domain: "", code: 1, userInfo: nil)))) }
            do {
                let cart = try JSONDecoder().decode([CartModel].self, from: data)
                completion(.success(cart))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
