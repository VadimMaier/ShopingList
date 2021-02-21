//
//  RecipesDataManager.swift
//  ShopingList
//
//  Created by ALEKSEY SUSLOV on 22.02.2021.
//

class RecipesDataManager {
    
    static let shared = RecipesDataManager()
    
    var recipes = [
        "Рагу" : [ "1": 2],
        "Рагу" : [ "1": 2]
    ]
    
    private init() {}
}
