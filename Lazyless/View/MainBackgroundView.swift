//
//  MainBackgroundView.swift
//  Lazyless
//
//  Created by Luiz Sena on 09/09/22.
//

import UIKit

class MainBackgroundView: UIView {

     lazy var rectBar: UIView = {
        let rect = CGRect()
        let rectView = UIView(frame: rect)
        rectView.translatesAutoresizingMaskIntoConstraints = false
        rectView.backgroundColor = UIColor(named: "mainColor")
        return rectView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.backgroundColor = UIColor(named: "bgColor")
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MainBackgroundView: ViewCoding {
    func setupView() {
        self.addSubview(rectBar)
    }

    func setupContrainsts() {
        NSLayoutConstraint.activate([
            rectBar.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            rectBar.centerYAnchor.constraint(equalTo: self.topAnchor),
            rectBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            rectBar.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
    }

    func setupHierarchy() {

    }
}
