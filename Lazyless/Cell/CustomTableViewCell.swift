//
//  CustomTableViewCell.swift
//  Lazyless
//
//  Created by Luiz Sena on 20/09/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var titleCard: String
    var pontuationValue: Float
    
    private var cardActivity: CardActivityView?

    init(titleCard: String, pontuationValue: Float){
        self.titleCard = titleCard
        self.pontuationValue = pontuationValue
        super.init(style: .default, reuseIdentifier: nil)
        self.cardActivity = CardActivityView(cardTitle: titleCard, pontuation: pontuationValue)
        self.cardActivity?.translatesAutoresizingMaskIntoConstraints = false
        buildLayout()
    }
    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        buildLayout()
//    }

    required init?(coder: NSCoder) {
        fatalError("Erro na UITableViewCell")
    }
}

extension CustomTableViewCell: ViewCoding {
    func setupView() {
    }

    func setupHierarchy() {
        self.contentView.addSubview(cardActivity!)
    }

    func setupContrainsts() {
        NSLayoutConstraint.activate([
            cardActivity!.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10),
            cardActivity!.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            cardActivity!.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            cardActivity!.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
        ])
    }
}
