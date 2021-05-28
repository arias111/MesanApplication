//
//  CartServiceProtocols.swift
//  MesanApplication
//
//  Created by galiev nail on 23.05.2021.
//

import Foundation

protocol CartServiceProtocols {
    func loadCart(completion: @escaping (Result<[CartModel], Error>) -> Void)
    func checkoutCart(completion: @escaping (Result<Bool, Error>) -> Void)
}
