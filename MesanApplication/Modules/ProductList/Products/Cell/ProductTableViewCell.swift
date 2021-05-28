//
//  ProductTableViewCell.swift
//  MesanApplication
//
//  Created by galiev nail on 18.05.2021.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    static let identifier = "productCell"
    
    // swiftlint:disable private_outlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        logoImageView.layer.masksToBounds = true
//        logoImageView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
