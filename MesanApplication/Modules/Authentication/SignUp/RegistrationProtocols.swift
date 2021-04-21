//
//  RegistrationProtocols.swift
//  MesanApplication
//
//  Created by galiev nail on 02.04.2021.
//

import Foundation

protocol RegistrationViewOutput: AnyObject {
    func validateEmail(enteredEmail: String) -> Bool
}
