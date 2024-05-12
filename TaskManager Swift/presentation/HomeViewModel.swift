//
//  HomeViewModel.swift
//  TaskManager Swift
//
//  Created by charles raj on 11/05/24.
//

import Foundation


class HomeViewModel : ObservableObject {
    
    @Published var taskList: [Tasks] = []
    @Published var completedTaskList: [Tasks] = []
    
    private var addTaskUseCase = AddTaskUseCase.shared
    private var updateTaskUseCase = UpdateTaskStatusUseCase.shared
    private var getAllTaskUseCase = GetAllTaskUseCase.shared
    private var getCompletedTaskUseCase = GetCompletedTaskUseCase.shared
    
    
    
    init() {
        self.getTaskList()
        self.getCompleteTask()
    }
    
    
    func homeEvents(event: HomeEvents) {
        switch event {
        case .addTask(let task): 
            self.addTask(task)
            break
        case.completeTask(var task):
            task.taskCompleted = 1
            self.completeTask(task)
            break
        case .completeNotTask(var task):
            task.taskCompleted = 0
            self.completeTask(task)
        }
    }
    
    private func addTask(_ task: Tasks) {
        
        Task(priority: .background) {
//               do {
            let taskId = await addTaskUseCase.execute(task)
            if taskId > 0 {
                self.getTaskList()
                self.getCompleteTask()
            }
//                   print(taskId)
//               } catch {
//                   print(error)
//               }
        }
    }
    
    private func completeTask(_ task: Tasks) {
        
        Task(priority: .background) {
//               do {
            let taskId = await updateTaskUseCase.execute(task)
//            if taskId > 0 {
                self.getTaskList()
                self.getCompleteTask()
//            }
//                   print(taskId)
//               } catch {
//                   print(error)
//               }
        }
    }
    
    private func getTaskList() {
        
        Task(priority: .background, operation: {
            let list = await getAllTaskUseCase.execute()
            DispatchQueue.main.async {
                self.taskList = list
            }
        })
    }
    
    private func getCompleteTask() {
        Task(priority: .background, operation: {
            let list  = await getCompletedTaskUseCase.execute()
            DispatchQueue.main.async{
                self.completedTaskList = list
            }
        })
    }
}
