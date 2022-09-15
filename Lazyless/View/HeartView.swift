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
        return heart
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10"
        label.font = .systemFont(ofSize: UIScreen.main.bounds.width/18.5)
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
