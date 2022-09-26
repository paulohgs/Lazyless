//
//  PersonaModel.swift
//  Lazyless
//
//  Created by Luiz Sena on 12/09/22.
//

import Foundation

struct Persona {
    var personaName: String
    var personaImageName: String
    var heartLevel: Int
    var heartImageName: String
    
    init(personaName: String, personaImageName: String, heartLevel: Int, heartImageName: String) {
        self.personaName = personaName
        self.personaImageName = personaImageName
        self.heartLevel = heartLevel
        self.heartImageName = heartImageName
    }
}

var preguicaModel = Persona(
    personaName: "Preguica-swan",
    personaImageName: "preguica",
    heartLevel: 1 ,
    heartImageName: "heart"
)
