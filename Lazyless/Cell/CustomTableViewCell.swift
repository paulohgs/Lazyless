//
//  CustomTableViewCell.swift
//  Lazyless
//
//  Created by Luiz Sena on 20/09/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    private let cardActivity: CardActivityView = {
        let card: CardActivityView = CardActivityView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
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
        self.addSubview(cardActivity)
    }

    func setupContrainsts() {
        NSLayoutConstraint.activate([
            cardActivity.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            cardActivity.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cardActivity.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            cardActivity.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

