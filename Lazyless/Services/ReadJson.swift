//
//  ReadJson.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 22/09/22.
//

import Foundation

struct ReadJsonDatabase {
    
    func loadJson() -> [SpeakModel]? {
        if let url = Bundle.main.url(forResource: "database", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData: [SpeakModel] = try decoder.decode([SpeakModel].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}





