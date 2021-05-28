//
//  PrimaryTextField.swift
//  MesanApplication
//
//  Created by galiev nail on 02.04.2021.
//

import Foundation
import UIKit

final class PrimaryTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    private func commonInit() {
        borderStyle = .line
        layer.masksToBounds = true
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        leftViewMode = UITextField.ViewMode.always
        leftView = spacerView
//        backgroundColor = Asset.Colors.activeBackground.color
    }
}
