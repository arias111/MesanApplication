//
//  CartViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 23.05.2021.
//

import UIKit
import Kingfisher

class CartViewController: UIViewController {

    private lazy var contentView = CartView()
    private let cartService: CartServiceProtocols = CartService()
    private var cartModel: [CartModel] = []

    @IBAction private func refreshBtn(_ sender: Any) {
        contentView.tableView.reloadData()
        print("tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.left.right.bottom.top.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        let nib1 = UINib(nibName: "CartTableViewCell", bundle: nil)
        contentView.tableView.register(nib1, forCellReuseIdentifier: CartTableViewCell.identifier)
        contentView.orderButton.addTarget(self, action: #selector(orderProduct), for: .touchUpInside)
        loadCart()
    }
    
    private func obtainCell(cell: CartTableViewCell, indexPath: IndexPath) {
        let cart = self.cartModel[indexPath.row]
        guard let imageUrl = URL(string: "http://localhost:8345/files/\(cart.image!)")
        else { return }
        cell.nameLabel.text = cart.name
        guard let quantity = cart.quantity
        else { return }
        print(cart)

        cell.quantityLabel.text = "\(quantity)"
        cell.productImage.kf.indicatorType = .activity
        cell.productImage.kf.setImage(with: imageUrl, placeholder: #imageLiteral(resourceName: "No-Image-Placeholder"), options: [.transition(.fade(0.5))], progressBlock: nil)
    }
    
    private func loadCart() {
        cartService.loadCart { result in
            switch result {
            case .success(let cart):
                self.cartModel = cart
                self.contentView.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func orderProduct() {
        cartService.checkoutCart { result in
            switch result {
            case let .success(success):
                print(success)
                let alert = UIAlertController(title: "Заказ офрмлен", message: "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ок", style: UIAlertAction.Style.default, handler: { alert in
                }))
                self.present(alert, animated: true, completion: nil)

            case let .failure(error):
                print(error)
                let alert = UIAlertController(title: "Заказ не офрмлен", message: "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ок", style: UIAlertAction.Style.default, handler: { alert in
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as? CartTableViewCell else { fatalError("Could not dequeue cell") }
        DispatchQueue.main.async {
            self.obtainCell(cell: cell, indexPath: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
