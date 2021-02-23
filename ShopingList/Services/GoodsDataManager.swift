//
//  NotesDataManager.swift
//  ShopingList
//
//  Created by Aleksei Goranov on 21.02.2021.
//

class GoodsDataManager {

    static let shared = GoodsDataManager()
    
//    var goods: [String: Double] = [
//        "Молоко" : 2,
//        "хлеб" : 1,
//        "печенье" : 3,
//        "говядина" : 1,
//        "мороженое" : 4,
//        "фери" : 1
//    ]
    
    var goods2: [String: (quantity: Double, unitOfQuantity: String)] = [
        "Молоко": (2, "л."),
        "хлеб": (1, "шт."),
        "печенье": (3, "пачка."),
        "пепси": (0.5, "л."),
        "мороженое": (4, "шт."),
        "фери": (1, "шт.")
    ]
    
    private init() {}
}
