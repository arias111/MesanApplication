//
//  MapView.swift
//  MesanApplication
//
//  Created by galiev nail on 19.04.2021.
//

import UIKit
import MapKit
// swiftlint:disable trailing_whitespace

class MapView: UIView {
    
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

    }
    
    // MARK: - Constraints
    private func makeConstraints() {}
}
