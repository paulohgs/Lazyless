//
//  CustomTableViewCell.swift
//  Lazyless
//
//  Created by Luiz Sena on 20/09/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    private let speak: SpeakView = {
        let speak: SpeakView = SpeakView()
        speak.translatesAutoresizingMaskIntoConstraints = false
        return speak
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Erro na UITableViewCell")
    }
}

extension CustomTableViewCell: ViewCoding {
    func setupView() {
    }

    func setupHierarchy() {
        self.addSubview(speak)
    }

    func setupContrainsts() {
        NSLayoutConstraint.activate([
            speak.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            speak.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}

