//
//  SpeakModelTests.swift
//  LazylessTests
//
//  Created by Paulo Henrique Gomes da Silva on 16/09/22.
//

@testable import Lazyless
import XCTest

final class SpeakModelTests: XCTestCase {
    
    func test_personaModelInit_personaInstanceIsNotNil() {
        let persona = Persona(
            personaName: "Preguiça",
            personaImageName: "preguica",
            heartLevel: 0,
            heartImageName: "heart"
        )
        
        XCTAssertNotNil(persona)
    }
    
    func test_speakModelInit_speakInstanceIsNotNil() {
        let speak = SpeakModel(
            title: "Preguica",
            textSpeak: "Lorem ipsum"
        )
        
        XCTAssertNotNil(speak)
    }
    
    func test_activityModelInit_activityInstanceIsNotNil() {
        let activity = ActvityModel(
            name: "Beber água",
            affectionPoint: 30,
            date: nil
        )
        XCTAssertNotNil(activity)
    }
    
}
