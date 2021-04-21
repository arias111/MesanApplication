//
//  RegistrationViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 27.03.2021.
//

import UIKit
import Firebase
// swiftlint:disable trailing_whitespace

class RegistrationViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    var activityIndicator: UIActivityIndicatorView!
    private lazy var contentView = RegistationView()
    // MARK: - Live cycle
    var presenter: RegistrationViewOutput?
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        setContinueButton(enabled: false)

        addTargets()
    }
    
    private func addTargets() {
        contentView.loginTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        contentView.passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        contentView.registrationButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
    }
    
    private func setContinueButton(enabled: Bool) {
        if enabled {
            contentView.registrationButton.alpha = 1.0
            contentView.registrationButton.isEnabled = true
        } else {
            contentView.registrationButton.alpha = 0.5
            contentView.registrationButton.isEnabled = false
        }
    }
    
    @objc private func handleSignUp(_ sender: Any) {
        guard
            let email = contentView.loginTextField.text,
            let password = contentView.passwordTextField.text
        else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("signUp")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as? LoginViewController
            vc?.modalPresentationStyle = .fullScreen
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc private func textFieldChanged() {
        
        guard
            let email = contentView.loginTextField.text,
            let password = contentView.passwordTextField.text
        else { return }
        
        let formFilled = !(email.isEmpty) && !(password.isEmpty)
        setContinueButton(enabled: formFilled)
    }
}
