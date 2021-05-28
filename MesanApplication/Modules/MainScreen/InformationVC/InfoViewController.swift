//
//  InfoViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 21.05.2021.
//

import UIKit
import FittedSheets

class InfoViewController: UIViewController {
    
    // swiftlint:disable private_outlet
    @IBOutlet weak var infoLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = name
    }
}
