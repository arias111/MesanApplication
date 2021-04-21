//
//  ViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 20.03.2021.
//

import UIKit
import Firebase
import SnapKit
import FirebaseDatabase
// swiftlint:disable trailing_whitespace
class LoginViewController: UIViewController, Storyboarded {
    var userProfile: UserProfile?
    var activityIndicator: UIActivityIndicatorView!
    weak var coordinator: MainCoordinator?
    private lazy var contentView = LoginView()
    // MARK: - Live cycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        setLoginButton(enabled: false)
        view.addSubview(contentView.continueButton)
    }
    
    func showActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator?.center = self.contentView.loginBtn.center
        self.view.addSubview(activityIndicator!)
        activityIndicator?.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillAppear),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    
    private func addTargets() {
        contentView.loginTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        contentView.passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        contentView.loginBtn.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        contentView.continueButton.addTarget(self, action: #selector(toSignUp), for: .touchUpInside)

    }
    
    @objc private func textFieldChanged() {

        guard
            let email = contentView.loginTextField.text,
            let password = contentView.passwordTextField.text
            else { return }

        let formFilled = !(email.isEmpty) && !(password.isEmpty)

        setLoginButton(enabled: formFilled)
    }
    
    @objc private func pushToRegVc(_ sender: Any) {
        print("tapped")
        coordinator?.navigateRegistration()
    }
    
    private func setLoginButton(enabled: Bool) {

        if enabled {
            contentView.loginBtn.alpha = 1.0
            contentView.loginBtn.isEnabled = true
        } else {
            contentView.loginBtn.alpha = 0.5
            contentView.loginBtn.isEnabled = false
        }
    }
    
    @objc private func handleSignIn() {
        setLoginButton(enabled: false)
        showActivityIndicator()
        
        guard let email = contentView.loginTextField.text,
              let password = contentView.passwordTextField.text
              else { return }
        Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
            if let error = error {
                print(error.localizedDescription)
                self.setLoginButton(enabled: true)
                self.handleError(error) 
                self.activityIndicator.stopAnimating()
                return
            }
            // self.saveToFirebase()
            self.presentingViewController?.dismiss(animated: true, completion: nil)
            print("logged in")
        }
    }
    
    // swiftlint:disable force_cast
    @objc func keyboardWillAppear(notification: NSNotification) {
        let userInfo = notification.userInfo!
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        contentView.continueButton.center =
            CGPoint(x: view.center.x,
                    y: view.frame.height - keyboardFrame.height - 16.0 - contentView.continueButton.frame.height / 2)
    }
    
    private func saveToFirebase() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let userData = ["email": userProfile?.email]
        let values = [uid: userData]
        Database.database().reference().child("users").onDisconnectUpdateChildValues(values) { (error, _) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("saved")
        }
    }
    @objc private func toSignUp() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true, completion: nil)
    }
}
