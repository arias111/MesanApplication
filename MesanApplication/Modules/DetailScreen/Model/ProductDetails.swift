//
//  ProductDetails.swift
//  MesanApplication
//
//  Created by galiev nail on 20.05.2021.
//

import Foundation

struct ProductDetails: Codable {
    let id: Int?
    let description: String?
    let name: String?
    let productId: Int?
    let imageName: String?
    
    // swiftlint:disable redundant_string_enum_value
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case description = "description"
        case name = "name"
        case productId = "productId"
        case imageName = "imageName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        productId = try values.decodeIfPresent(Int.self, forKey: .productId)
        imageName = try values.decodeIfPresent(String.self, forKey: .imageName)
    }
}
