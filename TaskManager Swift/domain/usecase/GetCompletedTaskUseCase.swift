//
//  GetCompletedTaskUseCase.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import Foundation

class GetCompletedTaskUseCase {
    
    static var shared = GetCompletedTaskUseCase(homeRepository: HomeRepositoryImpl.shared)
    
    var homeRepository : HomeRepository
    
    init(homeRepository: HomeRepository) {
        self.homeRepository = homeRepository
    }
    
    func execute() async -> [Tasks] {
        return await homeRepository.getCompletedTask()
    }
}
