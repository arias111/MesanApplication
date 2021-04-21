//
//  MainCoordinator.swift
//  MesanApplication
//
//  Created by galiev nail on 09.04.2021.
//

import Foundation
import UIKit
// swiftlint:disable trailing_whitespace

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = LoginViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateRegistration() {
        let vc = RegistrationViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
