//
//  HomeDataSource.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import Foundation

protocol HomeDataSource {
    
    func addTask(_ task: Tasks) async -> Int64
    
    func updateTaskStatus(_task: Tasks) async -> Int64
    
    func getAllTask() async -> [Tasks]
    
    func getCompletedTask() async -> [Tasks]
    
}
