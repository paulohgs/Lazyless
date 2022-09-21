//
//  PinFunction.swift
//  Lazyless
//
//  Created by Luiz Sena on 20/09/22.
//

import Foundation
import UIKit

extension UIView {
    func pin(to superview: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
        ])
    }
}
