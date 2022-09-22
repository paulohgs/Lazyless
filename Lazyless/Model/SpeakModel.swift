//
//  SpeakModel.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 12/09/22.
//

struct SpeakModel: Codable {
    var level0: [LevelModel]
    var level1: [LevelModel]
    
    struct LevelModel: Codable {
        var talk: String
        var buttonLabel: String
    }
}
