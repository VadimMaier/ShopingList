//
//  RecipesController.swift
//  ShopingList
//
//  Created by PenguinRaja on 21.02.2021.
//

import UIKit

class RecipesController: UITableViewController {
    
    let recipes = Recipe.getRecipes()

//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let recipe = recipes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = recipe.name
        
        cell.contentConfiguration = content

        return cell
    }
}
