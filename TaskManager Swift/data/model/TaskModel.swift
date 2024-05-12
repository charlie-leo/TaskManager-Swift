//
//  TaskModel.swift
//  TaskManager Swift
//
//  Created by charles raj on 10/05/24.
//

import Foundation

//@Model
//class TaskModel {
//    
//    
//    
//}


struct Tasks : Identifiable, Hashable {
    
    var id = UUID()
    
    var taskId: Int = 0
    var taskName: String = ""
    var taskDetails: String = ""
    var taskDate: String = ""
    var taskCompleted: Int = 0 // 0 : not completed , 1 : completed
    var taskFiles: [String] = []
    
    init(){
        
    }
    
    init(taskId: Int, taskName: String,
         taskDetails: String, taskDate: String,
         taskFiles: [String]){
        self.taskId = taskId
        self.taskName = taskName
        self.taskDetails = taskDetails
        self.taskDate = taskDate
        self.taskFiles = taskFiles
        
    }
    
}


class File : ObservableObject {
    @Published var fileId: Int = 0
    @Published var fileUrl: String = ""
    
    init(){
        
    }
    
    init(fileId: Int, fileUrl: String) {
        self.fileId = fileId
        self.fileUrl = fileUrl
    }
    
}
