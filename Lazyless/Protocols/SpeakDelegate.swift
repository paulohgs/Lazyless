//
//  SpeakDelegate.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 22/09/22.
//

import Foundation

protocol SpeakDelegate: AnyObject {
    func isCancelButtonTouched(touch: Bool)
    func isActivityButtonTouched(touch: Bool)
}
