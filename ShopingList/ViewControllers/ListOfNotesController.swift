//
//  ListOfNotesController.swift
//  ShopingList
//
//  Created by PenguinRaja on 21.02.2021.
//

import UIKit

class ListOfNotesController: UITableViewController {
    
    var goodsList = Good.getNotes()

    @IBAction func unwind(seque: UIStoryboardSegue) {
        if let addProductVC = seque.source as? AddViewController {
            guard let addProduct = addProductVC.productTextField.text else { return}
            goodsList.append(Good(name: addProduct, quantity: 2, unitOfQuantity: "qwe"))
        }
        else if let recipes = seque.source as? RecipesController {
            print(recipes.goods.description)
            goodsList += recipes.goods
        }
        
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        goodsList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let good = goodsList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = good.name
        content.secondaryText = "\(good.quantity) \(good.unitOfQuantity)"
        
        cell.contentConfiguration = content
        
        return cell
    }

}
