//
//  RegistrationViewPresenter.swift
//  MesanApplication
//
//  Created by galiev nail on 02.04.2021.
//

import Foundation

class RegistrationPresenter {}
extension RegistrationPresenter: RegistrationViewOutput {
    func validateEmail(enteredEmail: String) -> Bool {
//        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailFormat = "[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
}
