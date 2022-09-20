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
        label.text = "Preguiça-swan:"
        label.textAlignment = .left
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textSpeak: UILabel = {
        var label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ante dolor, vestibulum vel ex sit amet, dignissim vulputate ante. Integer lobortis ante ut risus molestie imperdiet."
        label.textColor = UIColor.gray
        label.textAlignment = .justified
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var speakButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var configuration = UIButton.Configuration.borderedProminent()
        configuration.title = "Falar..."
        configuration.baseForegroundColor = UIColor(named: "darkGrey")
        configuration.baseBackgroundColor = UIColor(named: "secondColor")
        button.configuration = configuration
//        button.setTitleColor(UIColor(named: "darkGrey"), for: .normal)
        button.layer.cornerRadius = 10
//        button.backgroundColor = UIColor(named: "secondColor")
        button.addTarget(self, action: #selector(actionButton), for: .touchDown)
        return button
    }()
    private lazy var habitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [title, textSpeak, speakButton, habitButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.layer.cornerRadius = 10
        stack.backgroundColor = UIColor.white
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.2
        stack.layer.shadowOffset = CGSize(width: 10, height: 10)
        stack.layer.shadowRadius = 10
        return stack
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func actionButton() {
        print(#function)
    }

}

extension SpeakView: ViewCoding {
    func setupView() {
        self.addSubview(stackView)

    }
    
    func setupContrainsts() {
        // constraints
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
    
    func setupHierarchy() {
        // define views hierarchy
    }
    
    
}
