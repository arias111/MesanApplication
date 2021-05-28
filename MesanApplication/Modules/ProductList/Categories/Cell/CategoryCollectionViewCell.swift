//
//  CategoryCollectionViewCell.swift
//  MesanApplication
//
//  Created by galiev nail on 14.05.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    // swiftlint:disable private_outlet
    @IBOutlet weak var categoryImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "cell"
    
    var context = CIContext(options: nil)

    override func awakeFromNib() {
        categoryImage.layer.cornerRadius = 12
        categoryImage.layer.masksToBounds = true
        categoryImage.clipsToBounds = true
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var isSelected: Bool {
        didSet {
            self.contentView.backgroundColor = isSelected ? UIColor.black : UIColor.white
        }
    }

    private var categories: CategoryModel?
    
    func set(categories: CategoryModel) {
        self.categories = categories
//        categoryImage.image = categories.imageName == nil
//            ? #imageLiteral(resourceName: "No-Image-Placeholder")
//            : nil
//        fetchImage()
        nameLabel.text = "Mock"
    }
}
