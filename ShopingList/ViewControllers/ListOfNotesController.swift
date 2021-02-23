//
//  ListOfNotesController.swift
//  ShopingList
//
//  Created by PenguinRaja on 21.02.2021.
//

import UIKit

class ListOfNotesController: UITableViewController {
    
    var goodsList = Note.getNotes()

    @IBAction func unwind(seque: UIStoryboardSegue) {
        guard let addProductVC = seque.source as? AddViewController else { return }
        guard let addProduct = addProductVC.productTextField.text else { return}
        NotesDataManager.shared.names.append(addProduct)
        print(goodsList)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

/*    override func numberOfSections(in tableView: UITableView) -> Int {
        goodsList.count
    } */

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
        content.secondaryText = good.count
        
        cell.contentConfiguration = content
        
        return cell
    }

}
