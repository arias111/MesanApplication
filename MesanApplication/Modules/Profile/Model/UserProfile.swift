//
//  UserProfile.swift
//  MesanApplication
//
//  Created by galiev nail on 16.04.2021.
//

import Foundation

struct UserProfile {
    let id: Int?
    let email: String?
    
    init(data: [String: Any]) {
        let id = data["id"] as? Int
        let email = data["email"] as? String
        self.id = id
        self.email = email
    }
}
