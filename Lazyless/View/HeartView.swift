//
//  HeartView.swift
//  Lazyless
//
//  Created by Luiz Sena on 14/09/22.
//

import UIKit

class HeartView: UIView {

    var heartLevel: Int = 1

    let imageHeart: UIImageView = {
        let heart: UIImageView = UIImageView(image: UIImage(named: "heart"))
        heart.translatesAutoresizingMaskIntoConstraints = false
        heart.contentMode = .scaleToFill
        return heart
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: UIScreen.main.bounds.width/19)
        label.textColor = UIColor.black
        label.text = "\(self.heartLevel)"
        return label
    }()

    init(heartLevel: Int) {
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

        self.heartLevel = heartLevel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
