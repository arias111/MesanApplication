//
//  CategoriesViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 14.05.2021.
//

import UIKit
import Kingfisher

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private lazy var contentView = CategoriesView()
    let url = "http://localhost:8345/getCategories"
    let productUrl = "http://localhost:8345/categories/1/productList"
    private let service: CategoryService = CategoryMockService()
    private let productService: ProductProtocols = ProductService()
    private var categories: [CategoryModel] = []
    private var products: [ProductsModel] = []
    private let detailService: DetailsInfoProtocols = DetailsService()
    var productInfo: String?
    private var details: ProductDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        let nib1 = UINib(nibName: "ProductTableViewCell", bundle: nil)
        contentView.tableView.register(nib1, forCellReuseIdentifier: ProductTableViewCell.identifier)
        
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.left.right.bottom.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        service.loadProduct(url: url) { [self] result in
            switch result {
            case .success(let categories):
                self.categories = categories
                contentView.collectionView.reloadData()

            case .failure(let error):
                print(error)
            }
        }
        
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        let nib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        contentView.collectionView.register(nib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        if let flowLayout = contentView.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        productService.loadProduct(url: productUrl) { [self] result in
            switch result {
            case .success(let products):
                self.products = products
                contentView.tableView.reloadData()
                        
            case .failure(let error):
            print(error)
            }
        }
    }
    
    private func obtainCell(cell: CategoryCollectionViewCell, indexPath: IndexPath) {
        let category = categories[indexPath.item]
        
        guard let imageUrl = URL(string: "http://localhost:8345/files/\(category.imageName!)")
        else { return }
        
        cell.categoryImage.kf.indicatorType = .activity
        cell.categoryImage.kf.setImage(with: imageUrl, placeholder: #imageLiteral(resourceName: "No-Image-Placeholder"))
    }
    
    private func obtainTableCell(cell: ProductTableViewCell, indexPath: IndexPath) {
        let product = products[indexPath.row]
        
        guard let name = product.name
        else { return }
        cell.nameLabel.text = name
        guard let imageUrl = URL(string: "http://localhost:8345/files/\(product.imageName!)")
        else { return }
        
        cell.logoImageView.kf.indicatorType = .activity
        cell.logoImageView.kf.setImage(with: imageUrl, placeholder: #imageLiteral(resourceName: "No-Image-Placeholder"))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
        else { fatalError("Could not dequeue cell") }
        cell.set(categories: categories[indexPath.item])
        obtainCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
     }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = categories[indexPath.item]
        let url = "http://localhost:8345/categories/\(category.id!)/productList"
        productService.loadProduct(url: url) { [self] result in
            switch result {
            case .success(let products):
                self.products = products
                DispatchQueue.main.async {
                    contentView.tableView.reloadData()
                }
                
            case .failure(let error):
            print(error)
            }
        }
    }
}

// TableView
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell
        else { fatalError("Could not dequeue cell") }

        obtainTableCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        navigationController?.pushViewController(vc!, animated: true)
        let product = products[indexPath.row]
        vc?.product = product
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
}
