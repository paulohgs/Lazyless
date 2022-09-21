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
    let completed: Bool
}

let activityModelMock = ActivityModel(
    name: "mock",
    affectionPoint: 10,
    date: Date(),
    completed: false
)
