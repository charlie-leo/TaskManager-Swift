//
//  GetAllTaskUseCase.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import Foundation

class GetAllTaskUseCase {
    
    
    static var shared = GetAllTaskUseCase(homeRepository: HomeRepositoryImpl.shared)
    
    var homeRepository : HomeRepository
    
    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
    }
    
    func execute() async -> [Tasks] {
        return await homeRepository.getAllTask()
    }
    
}
