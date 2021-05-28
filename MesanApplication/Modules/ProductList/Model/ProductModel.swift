//
//  ProductModel.swift
//  MesanApplication
//
//  Created by galiev nail on 14.05.2021.
//

import Foundation

struct ProductModel: Codable {
    
//    enum Rank: String, Codable {
//        case grandmaster = "Grandmaster"
//        case headOfCouncil = "Head of Jedi Council"
//        case master = "Master"
//        case knight = "Knight"
//    }
    
    let id: String?
    let name: String?
    let rank: Rank?
    let imageUrl: String?
}
