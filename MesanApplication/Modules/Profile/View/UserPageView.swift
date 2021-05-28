//
//  UserPageView.swift
//  MesanApplication
//
//  Created by galiev nail on 16.04.2021.
//

import UIKit
import SnapKit

class UserPageView: UIView {
    
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
        addSubview(logOutBtn)
        addSubview(tableView)
    }
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(10)
        return label
    }()
    
    lazy var logOutBtn: UIButton = {
        let btn = PrimaryButton()
        btn.setTitle("Выйти", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.01712364331, green: 0.1915538609, blue: 0.4312075078, alpha: 1)
        return btn
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "profiles")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Constraints
    
    private func makeConstraints() {
        logOutBtn.snp.makeConstraints { make in
            make.height.equalTo(LoginView.Appearance.mySize)
            make.width.equalTo(LoginView.Appearance.wigthSize)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(appearance.sSpace)
            make.bottom.lessThanOrEqualToSuperview().inset(105)
        }
        
        //        myImageView.snp.makeConstraints { make in
        //            make.width.height.equalTo(100)
        //            make.centerX.equalToSuperview()
        //            make.top.equalToSuperview().inset(20)
        //            make.bottom.lessThanOrEqualTo(tableView).inset(300)
        //        }
        //
        
        tableView.snp.makeConstraints { make in
            make.bottom.lessThanOrEqualTo(logOutBtn).inset(140)
            make.width.equalToSuperview()
            make.height.equalTo(250)
            //  make.top.equalTo(myImageView).inset(300)
        }
    }
}
