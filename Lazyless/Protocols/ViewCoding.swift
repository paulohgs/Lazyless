//
//  ViewCoding.swift
//  Lazyless
//
//  Created by Luiz Sena on 09/09/22.
//

import Foundation


protocol ViewCoding {
    func setupView()
    func setupHierarchy()
    func setupContrainsts()
}

extension ViewCoding{
    func buildLayout(){
        setupView()
        setupHierarchy()
        setupContrainsts()

    }
}
