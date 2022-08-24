//
//  Task.swift
//  Dairy master
//
//  Created by Евгений Воронов on 15.08.2022.
//

import Foundation

//Task model and  Sample Tasks...

// Array of Task
struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time = Date()
}

//Total task meta view...
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

// sample data for testing...

func getSimpleDate (offset: Int) -> Date {
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}


// Sample tasks
var tasks: [TaskMetaData] = [
    TaskMetaData( task: [Task(title: "Talk to Ijustine"),
                        Task(title: "Change fon my Iphone"),
                         Task(title: "Nothin")], taskDate: getSimpleDate(offset: 1)),
    TaskMetaData(task: [Task(title: "Talk to Jenna Ezarik")], taskDate: getSimpleDate(offset: -3)),
    TaskMetaData(task: [Task(title: "Meeting whith Tim Cook")], taskDate: getSimpleDate(offset: -8)),
    TaskMetaData(task: [Task(title: "Next version on SwiftUI")], taskDate: getSimpleDate(offset: 10)),
    TaskMetaData(task: [Task(title: "Learning to English")], taskDate: getSimpleDate(offset: -22)),
    TaskMetaData(task: [Task(title: "Watch courses to UIKit")], taskDate: getSimpleDate(offset: 15)),
    TaskMetaData(task: [Task(title: "Go to sleep")], taskDate: getSimpleDate(offset: -20))
]

