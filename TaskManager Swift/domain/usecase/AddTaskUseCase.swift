//
//  AddTaskUseCase.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import Foundation

class AddTaskUseCase {
    
    static var shared = AddTaskUseCase(homeRepository: HomeRepositoryImpl.shared)
    
    var homeRepository : HomeRepository
    
    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
    }
    
    func execute(_ task : Tasks) async ->  Int64 {
        return await homeRepository.addTask(task)
    }
    
}
