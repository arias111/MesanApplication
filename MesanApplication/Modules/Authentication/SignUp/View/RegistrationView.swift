//
//  RegistrationView.swift
//  MesanApplication
//
//  Created by galiev nail on 02.04.2021.
//

import Foundation
import UIKit
import SnapKit

final class RegistationView: UIView {
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
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Night"))
    }
    
    private func addSubviews() {
        addSubview(registrationButton)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(confirmTextField)
        addSubview(regLabel)
    }
    
    lazy var registrationButton: UIButton = {
        let btn = PrimaryButton()
        btn.setTitle("Создать аккаунт", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.01712364331, green: 0.1915538609, blue: 0.4312075078, alpha: 1)
        return btn
    }()
    
    lazy var loginTextField: UITextField = {
        let textField = PrimaryTextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Введите почту", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTF = PrimaryTextField()
        passwordTF.attributedPlaceholder =
            NSAttributedString(string: "Введите пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        passwordTF.isSecureTextEntry = true
        return passwordTF
    }()
    
    lazy var confirmTextField: UITextField = {
        let confirmTF = PrimaryTextField()
        confirmTF.attributedPlaceholder =
            NSAttributedString(string: "Подтверите пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        confirmTF.isSecureTextEntry = true
        return confirmTF
    }()
    
    lazy var regLabel: UILabel = {
        let registrLabel = PrimaryLabel()
        registrLabel.text = "Регистрация"
        return registrLabel
    }()
    
    func makeConstraints() {
        confirmTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(appearance.lSpace)
            make.height.greaterThanOrEqualTo(appearance.xxlSpace)
            make.width.greaterThanOrEqualTo(RegistationView.Appearance.wigthSize)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(appearance.xxlSpace)
            make.width.greaterThanOrEqualTo(RegistationView.Appearance.wigthSize)
            make.centerX.equalTo(confirmTextField)
            make.left.equalToSuperview().offset(appearance.lSpace)
            make.bottom.equalTo(confirmTextField).offset(-RegistationView.Appearance.mySize)
        }
        loginTextField.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(appearance.xxlSpace)
            make.width.greaterThanOrEqualTo(RegistationView.Appearance.wigthSize)
            make.centerX.equalTo(confirmTextField)
            make.left.equalToSuperview().offset(appearance.lSpace)
            make.bottom.equalTo(passwordTextField).offset(-RegistationView.Appearance.mySize)
        }
        
        regLabel.snp.makeConstraints { make in
            make.bottom.equalTo(loginTextField).offset(-70)
            make.centerX.equalToSuperview()
        }
        
        registrationButton.snp.makeConstraints { make in
            make.height.equalTo(RegistationView.Appearance.mySize)
            make.width.equalTo(confirmTextField).offset(-(appearance.xxxsSpace))
            make.centerX.equalTo(confirmTextField)
            make.top.equalTo(confirmTextField).offset(100)
        }
    }
}
