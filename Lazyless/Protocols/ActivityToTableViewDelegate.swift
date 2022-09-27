//
//  ActivityToTableView.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 26/09/22.
//

import Foundation

protocol ActivityToTableViewDelegate: AnyObject {
    func createActivity(text: String, value: Float)
}
