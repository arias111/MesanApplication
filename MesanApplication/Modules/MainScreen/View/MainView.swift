//
//  MainView.swift
//  MesanApplication
//
//  Created by galiev nail on 04.05.2021.
//
import UIKit
import SnapKit

class MainView: UIView {
    
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
        addSubview(emailLabel)
        addSubview(phoneLabel)
        addSubview(topView)
        addSubview(logoImage)
        addSubview(collectionView)
        addSubview(tableView)
        addSubview(clientLabel)
    }
    
    lazy var collectionView: UICollectionView = {
        let cellSize = CGSize(width: 130, height: 80)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = cellSize
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var emailLabel: UILabel = {
        var emailLabel = UILabel()
        emailLabel.font = emailLabel.font.withSize(15)
        emailLabel.text = "mesankazan@yandex.ru"
        emailLabel.textColor = .white
        return emailLabel
    }()

    lazy var clientLabel: UILabel = {
        var label = UILabel()
        label.text = "Наши клиенты"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var phoneLabel: UILabel = {
        var phoneLabel = UILabel()
        phoneLabel.text = "8(843)205 35 10"
        phoneLabel.font = phoneLabel.font.withSize(15)
        phoneLabel.textColor = .white
        return phoneLabel
    }()
    
    lazy var logoImage: UIImageView = {
        var logoImage = UIImageView()
        logoImage.image = #imageLiteral(resourceName: "mesan")
        return logoImage
    }()

    lazy var topView: UIView = {
        var topView = UIView()
        topView.addSubview(emailLabel)
        topView.addSubview(phoneLabel)
        topView.backgroundColor = #colorLiteral(red: 0.0224963557, green: 0.1755752563, blue: 0.3905380368, alpha: 1)
        return topView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Constraints
    private func makeConstraints() {
        topView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.lessThanOrEqualTo(115)
            make.width.equalToSuperview()
            make.bottom.lessThanOrEqualTo(clientLabel).offset(310)
        }
        
        logoImage.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(topView)
            make.right.equalTo(topView).inset(230)
        }

        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(8)
            make.left.greaterThanOrEqualTo(logoImage).inset(180)
            make.right.equalToSuperview().inset(10)
        }

        phoneLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualToSuperview().offset(40)
            make.leftMargin.equalTo(emailLabel)
            make.left.equalTo(logoImage).inset(230)
        }
        
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(snp.bottom)
            make.height.equalTo(100)
        }
        
        clientLabel.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView).inset(80)
            make.height.equalTo(100)
            make.width.equalTo(160)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.bottom.lessThanOrEqualTo(clientLabel).inset(120)
            make.width.equalToSuperview()
            make.height.equalTo(250)
        }
    }
}
