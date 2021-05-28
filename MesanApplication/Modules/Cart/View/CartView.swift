//
//  CartView.swift
//  MesanApplication
//
//  Created by galiev nail on 23.05.2021.
//

import Foundation
import UIKit
import SnapKit

class CartView: UIView {
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
       addSubview(topView)
       addSubview(logoImage)
       addSubview(tableView)
       addSubview(orderButton)
    }
    
    lazy var topView: UIView = {
        var topView = UIView()
        topView.backgroundColor = #colorLiteral(red: 0.0224963557, green: 0.1755752563, blue: 0.3905380368, alpha: 1)
        return topView
    }()
    
    lazy var logoImage: UIImageView = {
        var logoImage = UIImageView()
        logoImage.image = #imageLiteral(resourceName: "mesan")
        return logoImage
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        tableView.isScrollEnabled = true
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var orderButton: UIButton = {
        let btn = PrimaryButton()
        btn.backgroundColor = #colorLiteral(red: 0.01712364331, green: 0.1915538609, blue: 0.4312075078, alpha: 1)
        btn.setTitle("Оформить заказ", for: .normal)
        return btn
    }()
    
    // MARK: - Constraints
    
    private func makeConstraints() {
        
        topView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.lessThanOrEqualTo(70)
            make.width.equalToSuperview()
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(topView)
            make.right.equalTo(topView).inset(300)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalToSuperview().offset(70)
        }
        
        orderButton.snp.makeConstraints { make in
            make.height.equalTo(appearance.xxlSpace)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
            make.left.equalToSuperview().offset(appearance.sSpace)
        }
    }
}
