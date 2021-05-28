//
//  PrimaryButton.swift
//  MesanApplication
//
//  Created by galiev nail on 02.04.2021.
//

import Foundation
import UIKit

final class PrimaryButton: UIButton {
    enum CommonConstants {
        static let height: CGFloat = 48
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        titleLabel?.font = .boldSystemFont(ofSize: 16)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        backgroundColor = .blue
//        setTitleColor(Asset.Colors.textColor.color, for: .normal)
//        setTitleColor(Asset.Colors.textColor.color.withAlphaComponent(0.8), for: .highlighted)
//        setTitleColor(Asset.Colors.textColor.color.withAlphaComponent(0.3), for: .disabled)
    }
}
