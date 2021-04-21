//
//  UserPageView.swift
//  MesanApplication
//
//  Created by galiev nail on 16.04.2021.
//

import UIKit
import SnapKit
// swiftlint:disable trailing_whitespace

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
        addSubview(emailLabel)
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
        btn.alpha = 0.5
        //        btn.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Constraints
    
    private func makeConstraints() {
        logOutBtn.snp.makeConstraints { (make) in
            make.height.equalTo(LoginView.Appearance.mySize)
            make.width.equalTo(LoginView.Appearance.wigthSize)
            make.centerX .equalToSuperview()
            make.left.equalToSuperview().offset(appearance.sSpace)
            make.bottom.equalToSuperview().offset(-100)
        }
        
        emailLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(100)
        }
    }
}
