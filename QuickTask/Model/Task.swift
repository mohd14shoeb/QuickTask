//
//  Task.swift
//  QuickTask
//
//  Created by Mohammad Yasir on 07/02/21.
//

import Foundation

struct Task : Identifiable {
    var id: String = UUID().uuidString
    var title : String
    var subtitle : String
}
