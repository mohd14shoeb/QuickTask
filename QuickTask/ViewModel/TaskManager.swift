//
//  TaskManager.swift
//  QuickTask
//
//  Created by Mohammad Yasir on 07/02/21.
//

import Foundation


class TaskListViewModel: Identifiable , ObservableObject{
    var tasks : [Task] = [Task]()
    
    @Published var data = [
        Task(title: "Write Some Code" , subtitle : "Use Swift Programming as iOS Enthuciast"),
        Task(title: "Take some Rest" , subtitle : "Reading or Walking arround !"),
        Task(title: "Write some more code " , subtitle : "Related to your works or personal project"),
        Task(title: "Wrap UP " , subtitle : "After All , let watch some netflix and then go to the sleep")
    ]
    
    @Published var ask : Bool = false
    
    func addTask(task : Task){
        data.append(task)
    }
    
    func deleteTask(index : Int){
        data.remove(at: index)
    }
    
}
