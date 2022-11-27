//
//  DbRepository.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 26/11/2022.
//

import Foundation
import SQLite

class DbRepository {
    
    static let shared = DbRepository()
    
    var db: Connection?
    var wordsTable: Table?
    let wordColumn = Expression<String>("word")
    
    // Initializer access level change now
    private init() {
        let dbPath = Bundle.main.path(forResource: "lezgi_words", ofType: "sqlite")!
        do {
            db = try Connection(dbPath, readonly: true)
            
            wordsTable = Table("words")
            try db!.run(wordsTable!.create(ifNotExists: true){ t in
              t.column(wordColumn, primaryKey: true)
             })
        } catch {
            print("DbRepository error: \(error)")
        }
    }
    
    func findSuggestions(for text: String) -> [String] {
        if (db != nil && wordsTable != nil) {
            do {
                let mapRowIterator = try db!.prepareRowIterator(wordsTable!.filter(wordColumn.like(text.lowercased() + "%")).limit(3))
                let foundWords = try mapRowIterator.map { $0[wordColumn] }
                return foundWords
            } catch {
                print("DbRepository error: \(error)")
            }
        }
        return []
    }
}

/*
 sqlite3 lezgi_words.sqlite
 sqlite> CREATE TABLE words(word TEXT PRIMARY KEY ASC);
 sqlite> .mode csv
 sqlite> .import lezgi_words.csv words
 lezgi_words.csv:12254: INSERT failed: UNIQUE constraint failed: words.word
 sqlite> select count(*) from words;
 20356
 sqlite> .exit
 */
