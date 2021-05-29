//
//  UserViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 16.04.2021.
//

import UIKit
import Firebase
import FirebaseDatabase
import SwiftKeychainWrapper

class UserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var provider: String?
    private var currentUser: CurrentUser?
    let accessToken = KeychainWrapper.standard.string(forKey: "accessToken")
    let email = KeychainWrapper.standard.string(forKey: "email")

    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        contentView.tableView.register(nib, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        if accessToken == nil {
            openLoginViewController()
        }
        contentView.emailLabel.text = email
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchUserData()
    }
    
//    func loadMemberProfile() {
//        let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
//        let userId: String? = KeychainWrapper.standard.string(forKey: "userId")
//        let url = URL(string: "http://localhost:8345/users/\(userId)")
//
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
//        request.addValue("Bearer\(accessToken!)", forHTTPHeaderField: "Authorization")
//
//        let session = URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, let response = response
//            else { return }
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
//
//                if let parseJson = json {
//
//                    DispatchQueue.main.async {
//                        let username: String? = parseJson["username"] as? String
//                        let email: String? = parseJson["email"] as? String
//                        print(username, email)
//                    }
//                }
//            } catch {
//                print(error)
//            }
//        }
//    }
    
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
        if Auth.auth().currentUser?.providerData != nil {
            try? Auth.auth().signOut()
            openLoginViewController()
            print("logged out")
        }
        KeychainWrapper.standard.remove(forKey: "accessToken")
        KeychainWrapper.standard.remove(forKey: "userId")
        openLoginViewController()
    }
    
    private func fetchUserData() {
        if Auth.auth().currentUser != nil {
            if let userName = Auth.auth().currentUser?.email {
                contentView.emailLabel.isHidden = false
                contentView.emailLabel.text = userName
            } else {
                guard let uid = Auth.auth().currentUser?.uid
                else { return }
                Database.database().reference()
                    .child("users")
                    .child(uid)
                    .observeSingleEvent(of: .value, with: { snapshot in
                                            guard let userData = snapshot.value as? [String: Any]
                                            else { return }
                                            self.currentUser = CurrentUser(uid: uid, data: userData)
                                            self.contentView.emailLabel.text = "\(self.currentUser?.email ?? "noname") logged in"})
            }
        } else {
//  Нужен для недопуска в профиль при firebase
//            Auth.auth().addStateDidChangeListener { auth, user in
//                if user == nil {
//                    self.openLoginViewController()
//                }
//            }
            print("no data")
        }
    }
    
    private func openLoginViewController() {
        
        do {
            try Auth.auth().signOut()
            
            DispatchQueue.main.async {
//                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
                else { return }
                self.present(loginViewController, animated: true)
                return
            }
        } catch let error {
            print("Failed to sign out with error: ", error.localizedDescription)
        }
    }
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell)!
        cell.configure(with: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
