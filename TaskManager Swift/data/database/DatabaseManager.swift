//
//  DatabaseManager.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import Foundation
import SQLite

class DatabaseManager {

    static let shared = DatabaseManager()
    
    private let db : Connection
    
    init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask, true
        ).first!
        print("DB Connection Location : \(path)/TaskDatabase.db")
        db = try! Connection("\(path)/TaskDatabase.db")
    }
    
    func getDb() -> Connection {
        return db
    }
    
}
