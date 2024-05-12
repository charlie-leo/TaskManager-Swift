//
//  HomeDataSourceImpl.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import Foundation

class HomeDataSourceImpl : HomeDataSource{
    
    static var shared = HomeDataSourceImpl()
    
    private var taskTable = TaskTable.shared
    
    
    
    func addTask(_ task: Tasks) async -> Int64 {
        return await taskTable.insert(task: task)
    }
    
    func updateTaskStatus(_task: Tasks) async -> Int64 {
        return await taskTable.update(task: _task)
    }
    
    func getAllTask() async -> [Tasks] {
        return await taskTable.getAllTask()
    }
    
    func getCompletedTask() async -> [Tasks] {
        return await taskTable.getCompletedTask()
    }
    
    
    
    
}
