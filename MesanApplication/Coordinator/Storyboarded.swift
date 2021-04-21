//
//  Storyboarded.swift
//  MesanApplication
//
//  Created by galiev nail on 09.04.2021.
//

import Foundation
import UIKit
// swiftlint:disable force_cast

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
