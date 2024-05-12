//
//  HomeRepositoryImpl.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import Foundation

class HomeRepositoryImpl : HomeRepository {
    static var shared = HomeRepositoryImpl()
    
    
    private var homeDataSource = HomeDataSourceImpl.shared
    
    func addTask(_ task: Tasks) async -> Int64 {
        return await homeDataSource.addTask(task)
    }
    
    func updateTaskStatus(_ task: Tasks) async -> Int64 {
        return await homeDataSource.updateTaskStatus(_task: task)
    }
    
    func getAllTask() async -> [Tasks] {
        return await homeDataSource.getAllTask()
    }
    
    func getCompletedTask() async -> [Tasks] {
        return await homeDataSource.getCompletedTask()
    }
    
    
    
    
}
