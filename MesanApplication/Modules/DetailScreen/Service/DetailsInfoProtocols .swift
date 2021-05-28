//
//  DetailsInfoProtocols .swift
//  MesanApplication
//
//  Created by galiev nail on 20.05.2021.
//

import Foundation

protocol DetailsInfoProtocols {
    func loadProductDetails(id: Int, completion: @escaping (Result<ProductDetails, Error>) -> Void)
    func addToCart(productId: Int, completion: @escaping (Result<Bool, Error>) -> Void)
}
