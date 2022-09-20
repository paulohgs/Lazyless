//
//  HeartView.swift
//  Lazyless
//
//  Created by Luiz Sena on 14/09/22.
//

import UIKit

class HeartView: UIView {
    lazy var imageHeart: UIImageView = {
        let heart: UIImageView = UIImageView(image: UIImage(named: "heart"))
        heart.translatesAutoresizingMaskIntoConstraints = false
        heart.contentMode = .scaleToFill
        heart.layer.shadowColor = UIColor.black.cgColor
        heart.layer.shadowOpacity = 0.75
        heart.layer.shadowOffset = CGSize(width: 0, height: -2)
        heart.layer.shadowRadius = 5
        return heart
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.font = .systemFont(ofSize: UIScreen.main.bounds.width/19)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        self.addSubview(imageHeart)
        self.addSubview(label)

        NSLayoutConstraint.activate([
            imageHeart.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageHeart.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageHeart.topAnchor.constraint(equalTo: topAnchor),
            imageHeart.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: imageHeart.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: imageHeart.centerXAnchor)
        ])
//        imageHeart.bounds
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
