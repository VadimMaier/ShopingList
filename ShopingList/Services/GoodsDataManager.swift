//
//  NotesDataManager.swift
//  ShopingList
//
//  Created by Aleksei Goranov on 21.02.2021.
//

class GoodsDataManager {
    
    static let shared = GoodsDataManager()
    
    var goods = [
        "Молоко" : 2,
        "хлеб" : 1,
        "печенье" : 3,
        "говядина" : 1,
        "мороженое" : 4,
        "фери" : 1
    ]
    
    private init() {}
}
