//
//  LoginProtocols.swift
//  MesanApplication
//
//  Created by galiev nail on 02.04.2021.
//

import Foundation

protocol LoginViewInput: AnyObject {
    func showError(message: String)
    func presentEvents()
}

protocol LoginViewOutput: AnyObject {
    func loginIn(email: String, password: String)
}
