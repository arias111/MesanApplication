//
//  UserViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 16.04.2021.
//

import UIKit
import Firebase
import FirebaseDatabase

// swiftlint:disable trailing_whitespace

class UserViewController: UIViewController {
    private var provider: String?
    private var currentUser: CurrentUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchUserData()
    }
    
    private lazy var contentView = UserPageView()
    // MARK: - Live cycle
    
    override func loadView() {
        view = contentView
    }
    // MARK: - Targets
    
    private func addTargets() {
        contentView.logOutBtn.addTarget(self, action: #selector(signOut), for: .touchUpInside)
    }
    
    @objc private func signOut() {
        if let _ = Auth.auth().currentUser?.providerData {
            try? Auth.auth().signOut()
            openLoginViewController()
            print("logged out")
        }
    }
    
    private func fetchUserData() {
        if Auth.auth().currentUser != nil {
            if let userName = Auth.auth().currentUser?.email {
                contentView.emailLabel.isHidden = false
                contentView.emailLabel.text = userName
            } else {
                guard let uid = Auth.auth().currentUser?.uid else { return }
                Database.database().reference()
                    .child("users")
                    .child(uid)
                    .observeSingleEvent(of: .value, with: { (snapshot) in
                        guard let userData = snapshot.value as? [String: Any] else { return }
                        self.currentUser = CurrentUser(uid: uid, data: userData)
                        self.contentView.emailLabel.text = "\(self.currentUser?.email ?? "noname") logged in"
                    }) { (error) in
                        print(error)
                }
            }
        } else {
            
            Auth.auth().addStateDidChangeListener { (auth, user) in
                if user == nil {
                   self.openLoginViewController()
                }
            }
            print("no data")
        }
    }
    
    private func openLoginViewController() {
        
        do {
            try Auth.auth().signOut()
            
            DispatchQueue.main.async {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
                self.present(loginViewController, animated: true)
                return
            }
        } catch let error {
            print("Failed to sign out with error: ", error.localizedDescription)
        }
    }

}
