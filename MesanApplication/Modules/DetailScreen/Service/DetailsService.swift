//
//  DetailsService.swift
//  MesanApplication
//
//  Created by galiev nail on 20.05.2021.
//

import Foundation
import Alamofire
import Moya

class DetailsService: DetailsInfoProtocols {

    private let base = "http://localhost:8345/"
    let provider = MoyaProvider<MoyaCart>()

    func loadProductDetails(id: Int, completion: @escaping (Result<ProductDetails, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:8345/categories/\(id)/detail")
        else { return }
        
        AF.request(url, method: .get).responseJSON { response in
            guard let data = response.data,
                  let details = try? JSONDecoder().decode(ProductDetails.self, from: data)
            else { return }
            completion(.success(details))
        }
    }
    
    func addToCart(productId: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        provider.request(.addToCart(productId: productId)) { result in
            
            switch result {
            case let .success(moyaResponse):
                print(moyaResponse.request?.url ?? "")
                print(moyaResponse.statusCode)
                guard (200...299).contains(moyaResponse.statusCode)
                else { return completion(.failure(NSError(domain: "", code: 1, userInfo: nil))) }
                completion(.success(true))
//                do {
//                    let addResponse = try moyaResponse.map(AddResponse.self)
//                    completion(.success(addResponse))
//                } catch {
//                    completion(.failure(error))
//                }

            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
