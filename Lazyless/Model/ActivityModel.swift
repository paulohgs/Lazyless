//
//  ActivityModel.swift
//  Lazyless
//
//  Created by Luiz Sena on 14/09/22.
//

import Foundation

struct ActvityModel {
    let name: String
    let affectionPoint: Int
    let date: Date?
}

let activityModelMock = ActvityModel(
    name: "mock",
    affectionPoint: 10,
    date: Date()
)
