//
//  CategoryModel.swift
//  MesanApplication
//
//  Created by galiev nail on 14.05.2021.
//

import Foundation

struct CategoryModel: Codable {
    
    let id: Int?
    let name: String?
    let imageName: String?
    // swiftlint:disable redundant_string_enum_value
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case imageName = "imageName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        imageName = try values.decodeIfPresent(String.self, forKey: .imageName)
    }
}
