//
//  Recipe.swift
//  ShopingList
//
//  Created by ALEKSEY SUSLOV on 22.02.2021.
//

struct Recipe {
    let name: String
    let goods: [String: Double]
}

extension Recipe {
    static func getRecipes() -> [Recipe] {
        
        var newRecipes: [Recipe] = []
        
        let recipes = RecipesDataManager.shared.recipes
        
        for recipe in recipes {
            newRecipes.append(Recipe(name: recipe.key,
                                     goods: recipe.value))
        }
        
        return newRecipes
    }
}
