//
//  DetailView.swift
//  MesanApplication
//
//  Created by galiev nail on 20.05.2021.
//

import Foundation
import UIKit
import SnapKit

class DetailView: UIView {
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
        addSubview(productImage)
        addSubview(infoLabel)
        addSubview(textLabel)
        addSubview(cartButton)
    }
    
    lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "No-Image-Placeholder")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Замок 228"
        label.font = label.font.withSize(25)
        return label
    }()
    
    lazy var cartButton: UIButton = {
        let btn = PrimaryButton()
        btn.backgroundColor = #colorLiteral(red: 0.01712364331, green: 0.1915538609, blue: 0.4312075078, alpha: 1)
        btn.setTitle("Добавить в корзину", for: .normal)
        return btn
    }()
        
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = label.font.withSize(20)
        return label
    }()
    
    private func makeConstraints() {
        productImage.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(400)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(productImage.snp.bottom).offset(25)
            make.centerX.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(infoLabel.snp.bottom).offset(10)
//            make.bottom.greaterThanOrEqualToSuperview().inset(155)
        }
        
        cartButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(appearance.xxlSpace)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
            make.width.equalTo(DetailView.Appearance.wigthSize)
            make.left.equalToSuperview().offset(appearance.sSpace)
        }
    }
}
