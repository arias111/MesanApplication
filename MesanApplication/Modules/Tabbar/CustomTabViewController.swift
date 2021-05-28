//
//  CustomTabViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 07.05.2021.
//

import UIKit
import SwiftIcons

class CustomTabViewController: UITabBarController, UITabBarControllerDelegate {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupMiddleButton()
    }
    
    func setupMiddleButton() {
        
        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 25, y: -20, width: 50, height: 50))
        
        self.tabBar.addSubview(middleBtn)
        middleBtn.layer.cornerRadius = 25
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)
        middleBtn.setIcon(icon: .icofont(.home), iconSize: 20.0, color: UIColor.white, backgroundColor: #colorLiteral(red: 0.01770873554, green: 0.1912066936, blue: 0.4326294065, alpha: 1), forState: .normal)
        self.view.layoutIfNeeded()
    }
    
    // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2
    }
}
