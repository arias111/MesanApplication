//
//  ProductService.swift
//  MesanApplication
//
//  Created by galiev nail on 18.05.2021.
//

import Foundation
import Alamofire

class ProductService: ProductProtocols {
    
    func loadProduct(url: String, completion: @escaping (Result<[ProductsModel], Error>) -> Void) {
        guard let url = URL(string: url)
        else { return }

        AF.request(url).validate().response { response in
            guard let data = response.data
            else { return }
            do {
                let products = try JSONDecoder().decode([ProductsModel].self, from: data)
                completion(.success(products))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
