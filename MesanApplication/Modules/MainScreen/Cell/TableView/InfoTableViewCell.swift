//
//  InfoTableViewCell.swift
//  MesanApplication
//
//  Created by galiev nail on 21.05.2021.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    static let identifier = "cell"
    
    // swiftlint:disable private_outlet
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
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
            infoLabel.text = "Подбор товара"
        } else if indexPath.row == 1 {
            infoLabel.text = "Согласование цены"
        } else if indexPath.row == 2 {
            infoLabel.text = "Оплата счета"
        } else if indexPath.row == 3 {
            infoLabel.text = "Получение товара"
        }
    }
}
