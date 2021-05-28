//
//  CategoryService.swift
//  MesanApplication
//
//  Created by galiev nail on 14.05.2021.
//

import Foundation
protocol CategoryService {
    func loadProduct(url: String, completion: @escaping (Result<[CategoryModel], Error>) -> Void)
}
