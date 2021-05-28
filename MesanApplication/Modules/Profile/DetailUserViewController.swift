//
//  DetailUserViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 26.04.2021.
//

import UIKit
import Firebase

class DetailUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var contentView = UserDetailView()
    // MARK: - Live cycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        let nib = UINib(nibName: "DetailTableViewCell", bundle: nil)
        contentView.tableView.register(nib, forCellReuseIdentifier: DetailTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as? DetailTableViewCell)!
        if Auth.auth().currentUser != nil {
            if Auth.auth().currentUser?.email != nil {
//                contentView.emailLabel.isHidden = false
//                contentView.emailLabel.text = userName
            }
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            
        case 0:
                return "Имя"
        case 1:
                return "Детали"
        default:
                return ""
        }
    }
}
