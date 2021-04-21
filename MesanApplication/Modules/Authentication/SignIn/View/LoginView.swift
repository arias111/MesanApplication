//
//  LoginView.swift
//  MesanApplication
//
//  Created by galiev nail on 02.04.2021.
//

import Foundation
import UIKit
import SnapKit
// swiftlint:disable trailing_whitespace

final class LoginView: UIView {
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
        backgroundColor = UIColor(patternImage: UIImage(named: "Night.png")!)

    }
    
    private func addSubviews() {
        addSubview(logLabel)
        addSubview(continueButton)
        addSubview(loginBtn)
        addSubview(loginTextField)
        addSubview(passwordTextField)
    }
    // MARK: - Init
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(secondaryColor, for: .normal)
        button.layer.cornerRadius = 4
        //        self.view.addSubview(button)
        return button
    }()
    
    lazy var loginBtn: UIButton = {
        let btn = PrimaryButton()
        btn.setTitle("Войти", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.alpha = 0.5
        //        btn.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return btn
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = PrimaryTextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Введите почту",
                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTF = PrimaryTextField()
        passwordTF.attributedPlaceholder =
            NSAttributedString(string: "Введите пароль",
                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTF.isSecureTextEntry = true
        return passwordTF
    }()
    
    lazy var logLabel: UILabel = {
        let registrLabel = PrimaryLabel()
        registrLabel.text = "Авторизация"
        return registrLabel
    }()
    // MARK: - Constraints

    func makeConstraints() {
        
        continueButton.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(appearance.xxlSpace)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(300)
        }
        loginBtn.snp.makeConstraints { (make) in
            make.height.equalTo(LoginView.Appearance.mySize)
            make.width.equalTo(LoginView.Appearance.wigthSize)
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(appearance.sSpace)
        }
        
        loginTextField.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(appearance.xxlSpace)
            make.width.greaterThanOrEqualTo(LoginView.Appearance.wigthSize)
            make.centerX.equalToSuperview().offset(150)
            make.bottom.equalTo(loginBtn).offset(-150)
            make.left.right.equalTo(loginBtn)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(appearance.xxlSpace)
            make.width.greaterThanOrEqualTo(LoginView.Appearance.wigthSize)
            make.centerX.equalToSuperview().offset(150)
            make.bottom.equalTo(loginTextField).offset(LoginView.Appearance.mySize)
            make.left.right.equalTo(loginBtn)
        }
        
        //        guard let messanImage = UIImage(named: "logomesan") else {return}
        //            let imageView = UIImageView(image: messanImage)
        logLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(loginTextField).offset(-70)
            make.centerX.equalToSuperview()
        }
    }
}
