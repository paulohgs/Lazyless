//
//  ActivityModel.swift
//  Lazyless
//
//  Created by Luiz Sena on 14/09/22.
//

import Foundation

struct ActivityModel {
    let name: String
    let affectionPoint: Int
    let date: Date?
    
    init(name: String, affectionPoint: Int, date: Date?) {
        self.name = name
        self.affectionPoint = affectionPoint
        self.date = date
    }
    let completed: Bool
}

let activityModelMock = ActivityModel(
    name: "mock",
    affectionPoint: 10,
    date: Date(),
    completed: false
)
