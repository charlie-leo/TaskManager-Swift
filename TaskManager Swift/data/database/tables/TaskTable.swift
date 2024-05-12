//
//  TaskTable.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import Foundation
import SQLite

class TaskTable {
    
    static let shared = TaskTable(db: DatabaseManager.shared.getDb())
    
    private let tasksTable = Table("tasks")
    private let taskId = Expression<Int>("taskId")
    private let taskName = Expression<String>("taskName")
    private let taskDetails = Expression<String>("taskDetails")
    private let taskDate = Expression<String>("taskDate")
    private let taskCompleted = Expression<Int>("taskCompleted")
    private let taskFile = Expression<String>("taskFile")
    
    private var db: Connection
    
    init (db: Connection) {
        self.db = db
        try! db.run(
            tasksTable.create(ifNotExists: true) { table in
                table.column(taskId, primaryKey: PrimaryKey.autoincrement)
                table.column(taskName, defaultValue: "")
                table.column(taskDetails, defaultValue: "")
                table.column(taskDate, defaultValue: "")
                table.column(taskCompleted, defaultValue: 0)
                table.column(taskFile,defaultValue: "")
            }
        )
    }
    
    func insert(task : Tasks) async -> Int64{
        do {
            let insert = tasksTable.insert(
                self.taskName <- task.taskName,
                self.taskDetails <- task.taskDetails,
                self.taskDate <- task.taskDate,
                self.taskCompleted <- 0,
                self.taskFile <- ""
            )
            
            let taskId = try db.run(insert)
            return taskId
        } catch {
            print(error)
        }
        return 0
    }
    
    func update(task : Tasks) async -> Int64{
        do {
            let item = tasksTable.filter(taskId == task.taskId)
            let update = item.update(
                self.taskName <- task.taskName,
                self.taskDetails <- task.taskDetails,
                self.taskDate <- task.taskDate,
                self.taskCompleted <- task.taskCompleted,
                self.taskFile <- ""
            )
            
            let taskId = try db.run(update)
            return Int64(taskId)
        } catch {
            print(error)
        }
        return 0
    }
    
    func getAllTask() async -> [Tasks] {
        
//        do {
        var taskList = [Tasks]()
//            let list = tasksTable.select()
            for item in try! db.prepare(tasksTable.filter(taskCompleted == 0)) {
                taskList.append(Tasks(taskId: item[taskId], taskName: item[taskName], taskDetails: item[taskDetails], taskDate: item[taskDate], taskFiles: [item[taskFile]]))
            }
            return taskList
//        } catch {
//            print(error)
//        }
    }
    
    func getCompletedTask() async -> [Tasks] {
        
//        do {
        var taskList = [Tasks]()
//            let list = tasksTable.select()
        for item in try! db.prepare(tasksTable.filter(taskCompleted == 1)) {
                taskList.append(Tasks(taskId: item[taskId], taskName: item[taskName], taskDetails: item[taskDetails], taskDate: item[taskDate], taskFiles: [item[taskFile]]))
            }
            return taskList
//        } catch {
//            print(error)
//        }
    }

    
    
}
