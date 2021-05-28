//
//  CategoryMockService.swift
//  MesanApplication
//
//  Created by galiev nail on 14.05.2021.
//

import Foundation
import Alamofire

class CategoryMockService: CategoryService {
    
//    private lazy var mockCategory: CategoryModel = CategoryModel(id: "1", name: "Замок", imageName: nil)

    func loadProduct(url: String, completion: @escaping (Result<[CategoryModel], Error>) -> Void) {
        guard let url = URL(string: url)
        else { return }

        AF.request(url).validate().response { response in
            guard let data = response.data
            else { return }
            do {
                let categories = try JSONDecoder().decode([CategoryModel].self, from: data)
                completion(.success(categories))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func sendRequest(url: String, complition: @escaping (_ categories: [CategoryModel]) -> Void) {
        guard let url = URL(string: url)
        else { return }
        AF.request(url).validate().responseJSON { response in
            guard let data = response.data
            else { return }
            print(data)
            do {
                let categories = try JSONDecoder().decode([CategoryModel].self, from: data)
                complition(categories)
                print(categories)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
