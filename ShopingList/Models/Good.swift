//
//  Notes.swift
//  ShopingList
//
//  Created by Aleksei Goranov on 21.02.2021.
//

struct Good {
    let name: String
    let count: Int
}

extension Good {
    static func getNotes() -> [Good] {
        
        var newGoods: [Good] = []
        
        let goods = GoodsDataManager.shared.goods
        
        for good in goods {
            newGoods.append(Good(name: good.key,
                                 count: good.value))
        }
        
        return newGoods
    }
}
