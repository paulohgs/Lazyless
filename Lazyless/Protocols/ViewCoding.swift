//
//  ViewCoding.swift
//  Lazyless
//
//  Created by Luiz Sena on 09/09/22.
//

import Foundation


protocol ViewCoding {
    func setupView()
    func setupContrainsts()
    func setupHierarchy()
}

extension ViewCoding{
    func buildLayout(){
        setupView()
        setupContrainsts()
        setupHierarchy()
    }
}
