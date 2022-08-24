//
//  DateValue.swift
//  Diary Master
//
//  Created by Евгений Воронов on 23.08.2022.
//

import Foundation
// Model Data value...

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
