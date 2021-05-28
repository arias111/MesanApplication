//
//  PrimaryLabel.swift
//  MesanApplication
//
//  Created by galiev nail on 20.03.2021.
//

import Foundation
import UIKit

final class PrimaryLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        textAlignment = .center
        font.withSize(30)
    }
}
