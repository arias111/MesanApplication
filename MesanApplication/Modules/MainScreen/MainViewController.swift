//
//  MainViewController.swift
//  MesanApplication
//
//  Created by galiev nail on 04.05.2021.
//

import UIKit
import FittedSheets

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    private lazy var contentView = MainView()
    
    var options: [String] = [
        "Напишите нам или выберите в разделе каталога промышленные ручки, замки, петли, уплотнители и аксессуары.",
        "Напишите нам для согласования цены и условий поставки.", "Оплатите счет по реквизитам.",
        "Получите товар по доставке или заберите самостоятельно с нашего склада."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        
        view.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        let tableNib = UINib(nibName: "InfoTableViewCell", bundle: nil)
        contentView.tableView.register(tableNib, forCellReuseIdentifier: InfoTableViewCell.identifier)
        
        contentView.collectionView.delegate = self
        contentView.collectionView.dataSource = self
        let nib = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        contentView.collectionView.register(nib, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        if let flowLayout = contentView.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
    }
    
    private func addTargets() {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    // убрать force
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell)!
        cell.configure(with: indexPath)
        return cell
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as? InfoTableViewCell)!
        cell.configure(with: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let controller = storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController
        controller?.name = getText(for: indexPath)
        var options = SheetOptions()
        options.pullBarHeight = 30
        options.shouldExtendBackground = false
        options.useFullScreenMode = true
        let sheet = SheetViewController(controller: controller!, sizes: [.percent(0.30), .intrinsic], options: options)
        sheet.treatPullBarAsClear = true
        sheet.minimumSpaceAbovePullBar = 20
        sheet.cornerRadius = 30
        sheet.gripSize = CGSize(width: 100, height: 12)
        self.present(sheet, animated: true, completion: nil)
    }
    
    func getText(for indexPath: IndexPath) -> String? {
        return options[indexPath.row]
    }
}
