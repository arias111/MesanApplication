//
//  ProductsModel.swift
//  MesanApplication
//
//  Created by galiev nail on 16.05.2021.
//

import Foundation
import Alamofire

struct ProductsModel: Codable {
    
    let id: Int?
    let name: String?
    let categoryId: Int?
    let description: String?
    let imageName: String?
    
    // swiftlint:disable redundant_string_enum_value
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case categoryId = "categoryId"
        case description = "description"
        case imageName = "imageName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        categoryId = try values.decodeIfPresent(Int.self, forKey: .categoryId)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        imageName = try values.decodeIfPresent(String.self, forKey: .imageName)
    }
}
