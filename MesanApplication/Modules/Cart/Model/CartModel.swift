//
//  CartModel.swift
//  MesanApplication
//
//  Created by galiev nail on 23.05.2021.
//

import Foundation

struct CartModel: Codable {
    let id: Int?
    let name: String?
    let size: String?
    let image: String?
    let quantity: Int?
    
    // swiftlint:disable redundant_string_enum_value
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case size = "size"
        case image = "image"
        case quantity = "quantity"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        size = try values.decodeIfPresent(String.self, forKey: .size)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
    }
}
