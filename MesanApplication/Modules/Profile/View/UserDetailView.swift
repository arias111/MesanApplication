//
//  UserDetailView.swift
//  MesanApplication
//
//  Created by galiev nail on 26.04.2021.
//

import Foundation
import UIKit
import SnapKit

class UserDetailView: UIView {
    
    struct Appearance: Grid {
        let textFieldHeight: CGFloat = 40
        let buttonHeight: CGFloat = 50
    }
    
    struct ViewModel {
        let isActiveNextButton: Bool
    }
    
    let appearance: Appearance
    // MARK: - Init
    
    init(frame: CGRect = .zero, appearance: Appearance = Appearance()) {
        self.appearance = appearance
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubviews()
        setupStyles()
        makeConstraints()
    }
    
    private func setupStyles() {
        backgroundColor = .white
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    func makeConstraints() {
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
