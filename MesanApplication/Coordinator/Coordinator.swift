//
//  Coordinator.swift
//  MesanApplication
//
//  Created by galiev nail on 09.04.2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    func start()
}
