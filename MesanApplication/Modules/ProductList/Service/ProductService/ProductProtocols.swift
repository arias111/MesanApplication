//
//  ProductProtocols.swift
//  MesanApplication
//
//  Created by galiev nail on 16.05.2021.
//

import Foundation

protocol ProductProtocols {
    func loadProduct(url: String, completion: @escaping (Result<[ProductsModel], Error>) -> Void)
}
