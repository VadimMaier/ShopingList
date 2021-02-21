//
//  Notes.swift
//  ShopingList
//
//  Created by Aleksei Goranov on 21.02.2021.
//

import Foundation

struct Note {
    let name: String
    let count: Int
}

extension Note {
    static func getNotes() -> [Note] {
        
        var notes: [Note] = []
        
        let names = NotesDataManager.shared.names
        let counts = NotesDataManager.shared.counts
        
        for index in 0..<names.count {
            let note = Note(
                name: names[index],
                count: counts[index]
            )
            
            notes.append(note)
        }
        
        return notes
    }
}
