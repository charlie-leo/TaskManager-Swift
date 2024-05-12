//
//  Singleton.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import Foundation

class Singleton {
    
    
    static var database = DatabaseManager()
    
    static var taskTable = TaskTable(db: database.getDb())
    
}
