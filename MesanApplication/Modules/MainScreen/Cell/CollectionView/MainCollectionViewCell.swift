//
//  MainCollectionViewCell.swift
//  MesanApplication
//
//  Created by galiev nail on 06.05.2021.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    static let identifier = "cell"
    @IBOutlet private weak var imageOutlet: UIImageView!
    
    override func awakeFromNib() {
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
    
    func configure(with indexPath: IndexPath) {
        var imageArray: [UIImage] = []
        for i in 0...5 {
            let image = UIImage(named: "image\(i)")
            imageArray.append(image!)
        }
        let image = imageArray[indexPath.item]
        imageOutlet.image = image
    }
}
