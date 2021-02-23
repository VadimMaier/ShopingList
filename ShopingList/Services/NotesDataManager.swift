//
//  NotesDataManager.swift
//  ShopingList
//
//  Created by Aleksei Goranov on 21.02.2021.
//

import Foundation

class NotesDataManager {
    
    static let shared = NotesDataManager()
    
    var names = [ "Молоко", "хлеб", "печенье", "говядина", "мороженое"]
    
    var counts = ["2", "1", "3", "1", "4"]
    
    private init() {}
    
}
