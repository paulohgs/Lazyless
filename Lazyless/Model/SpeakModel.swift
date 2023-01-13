//
//  SpeakModel.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 12/09/22.
//

import Foundation

struct SpeakModel: Decodable {
    //    var level0: [LevelModel]
    //    var level1: [LevelModel]
    let id: Int
    let levelModels: [LevelModel]
    
    struct LevelModel: Decodable {
        let talk: String
        let buttonLabel: String
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dict = try container.decode([String: [LevelModel]].self)
        guard let key = dict.keys.first,
              let id = Int(key.replacingOccurrences(of: "level", with: "")) else {
            throw NSError(domain: "Decoder", code: 0, userInfo: [:])
        }
        self.id = id
        levelModels = dict[key] ?? []
    }
}
