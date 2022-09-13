//
//  SpeakView.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 12/09/22.
//

import UIKit

class SpeakView: UIView {
    
    private lazy var title: UILabel = {
        var label = UILabel()
        label.text = "Você não possui atividades"
        label.textColor = UIColor.systemGray
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SpeakView: ViewCoding {
    func setupView() {
        self.addSubview(title)
    }
    
    func setupContrainsts() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    func setupHierarchy() {
        // define views hierarchy
    }
    
    
}
