//
//  ProfileTableViewCell.swift
//  MesanApplication
//
//  Created by galiev nail on 24.04.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    static let identifier = "cell"
    @IBOutlet private weak var imageIcon: UIImageView!
    @IBOutlet private weak var cellButton: UIButton!
    @IBOutlet private weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
    
    func configure(with indexPath: IndexPath) {
        if indexPath.row == 0 {
            imageIcon?.image = #imageLiteral(resourceName: "profile")
            cellLabel.text = "Account Details"
        } else if indexPath.row == 1 {
            imageIcon?.image = #imageLiteral(resourceName: "like")
            cellLabel.text = "Wishlist"
        } else if indexPath.row == 2 {
            imageIcon?.image = #imageLiteral(resourceName: "9")
            cellLabel.text = "Order history"
        } else if indexPath.row == 3 {
            imageIcon?.image = #imageLiteral(resourceName: "setting")
            cellLabel.text = "Settings"
        }
    }
}
