//
//  DetailViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 20.05.2021.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    var descriptionProduct: String = ""
    var name: String = ""
    var image: UIImage?
    var id: Int?
    var product: ProductsModel?
    private let detailService: DetailsInfoProtocols = DetailsService()
    var details: ProductDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        addTargets()
        update()
    }
    
    private lazy var contentView = DetailView()
    var apiManager = DetailsService()
    
    private func addTargets() {
        contentView.cartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
    }

    func productSelected(id: Int) {
        detailService.loadProductDetails(id: id) {  [weak self] result in
            switch result {
            case .success(let productDetails):
                self?.details = productDetails

            case .failure(let error):
                print(error)
            }
        }
    }
    
    func update() {
        detailService.loadProductDetails(id: product?.id ?? 0) {  [weak self] result in
            switch result {
            case .success(let productDetails):
                DispatchQueue.main.async {
                    self?.details = productDetails
                    self?.contentView.textLabel.text = self?.details?.description
                    self?.contentView.infoLabel.text = self?.product?.name
                    guard let image = self?.details?.imageName
                    else { return }
                    guard let imageUrl = URL(string: "http://localhost:8345/files/\(image)")
                    else { return }
                    
                    self?.contentView.productImage.kf.indicatorType = .activity
                    self?.contentView.productImage.kf.setImage(with: imageUrl, placeholder: #imageLiteral(resourceName: "No-Image-Placeholder"))
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func addToCart() {
        print("tapped")
        apiManager.addToCart(productId: product?.id ?? 0) { result in
            switch result {
            case let .success(success):
                print(success)
                let alert = UIAlertController(title: "Товар Добавлен", message: "Продолжить покупки?", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "В корзину", style: UIAlertAction.Style.default, handler: { alert in
                    self.performSegue(withIdentifier: "segue", sender: self)
                }))
                alert.addAction(UIAlertAction(title: "Продолжить покупки", style: UIAlertAction.Style.cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            case let .failure(error):
                let alert = UIAlertController(title: "Товар не добавлен", message: "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segue"
        else { return }
        guard let destination = segue.destination as? CartViewController
        else { return }
    }
}
