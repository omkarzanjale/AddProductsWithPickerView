//
//  ViewController.swift
//  Products
//
//  Created by Mac on 16/09/21.
//
/*
 Program - add new products on second page display all added products on home page while taking info of product use pickerview and also take two different cells for two different categories
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTableView:UITableView!
    
    var productsArray:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Products"
        let nibFile = UINib(nibName: "ElectricSectionCell", bundle: Bundle.main)
        firstTableView.register(nibFile, forCellReuseIdentifier: "ElectricSectionCell")
        firstTableView.tableFooterView = UIView()
        self.firstTableView.dataSource = self
        self.firstTableView.delegate = self
    }

    @IBAction func addProductAction(_ sender: Any) {
        if let secondViewControllerObj = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as? SecondViewController{
            secondViewControllerObj.secondViewControllerDelegate = self
            navigationController?.pushViewController(secondViewControllerObj, animated: true)
        } else {
                print("Unable to find SecondViewController in storyboard!!!")
        }
    }
}
//
//MARK: TableView Methods
//
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = productsArray[indexPath.row]
        if  product.category == "ELECTRIC" {
            if let electricCell = firstTableView.dequeueReusableCell(withIdentifier: "ElectricSectionCell", for: indexPath)as? ElectricSectionCell {
                electricCell.categoryLabel.text = product.category
                electricCell.nameLabel.text = product.name
                electricCell.priceLabel.text = String(product.price)
                return electricCell
            } else {
                return UITableViewCell()
            }
        } else {
            if let fashionCell = firstTableView.dequeueReusableCell(withIdentifier: "FashionSectionCell", for: indexPath)as? FashionSectionCell {
                fashionCell.categoryLabel.text = product.category
                fashionCell.nameLabel.text = product.name
                fashionCell.priceLabel.text = String(product.price)
                return fashionCell
            } else {
                return UITableViewCell()
            }
        }
    }
}
//
//MARK: SecondViewControllerProtocol
//
extension ViewController: SecondViewControllerProtocol {
    
    func passedData(_ category: String?, _ name: String?, _ price: String?) {
        guard let categoryValue = category else {
            return
        }
        guard let nameValue = name else {
            return
        }
        guard let priceValue = price else {
            return
        }
        if let priceVal = Int(priceValue){
            productsArray.append(Product(category: categoryValue, name: nameValue, price: priceVal))
            firstTableView.reloadData()
        }
    }
}
