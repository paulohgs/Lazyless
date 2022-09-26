//
//  ActivityViewDelegate.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 22/09/22.
//

protocol ActivityViewDelegate: AnyObject {
    func getTextInput(text: String) -> String
    func getSliderValue(val: Int) -> Int
}
