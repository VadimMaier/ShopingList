//
//  RecipesController.swift
//  ShopingList
//
//  Created by PenguinRaja on 21.02.2021.
//

import UIKit

class RecipesController: UITableViewController {
    
    let recipes = Recipe.getRecipes()
    var goods = [Good]()

    // MARK: - Table view data source

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
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        for good in recipes[indexPath.row].goods {
            goods.append(
                Good(name: good.key,
                     quantity: good.value.quantity,
                     unitOfQuantity: good.value.unitOfQuantity)
            )
        }
        return indexPath
    }
}
