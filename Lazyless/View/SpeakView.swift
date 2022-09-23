//
//  SpeakView.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 12/09/22.
//

import UIKit

class SpeakView: UIView {

    weak var delegate: SpeakDelegate?
    
    private lazy var speak = ReadJsonDatabase().loadJson()
    
    private lazy var arrayViews: [UIView] = [title, textSpeak, speakButton, cancelButton]
//    private var textos: String = JSONDecoder().decode(String.self, from: database.json)
    
    private var title: UILabel = {
        var label = UILabel()
        label.text = "\(preguicaModel.personaName):"
        label.textAlignment = .left
        label.textColor = UIColor(named: "titleColor")
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textSpeak: UILabel = {
        var label = UILabel()
        label.text = speak?.level0[0].talk
        label.textColor = UIColor(named: "textColor")
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
        configuration.title = speak?.level0[0].buttonLabel
        configuration.baseForegroundColor = UIColor(named: "darkGrey")
        configuration.baseBackgroundColor = UIColor(named: "secondColor")
        button.configuration = configuration
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(actionButton), for: .touchDown)
        return button
    }()
    private var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancelar", for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [arrayViews[0], arrayViews[1], arrayViews[2], arrayViews[3]])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 15
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.layer.cornerRadius = 10
        stack.backgroundColor = UIColor(named: "cardColor")
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
        stack.layer.shadowColor = UIColor.black.cgColor
        stack.layer.shadowOpacity = 0.2
        stack.layer.shadowOffset = CGSize(width: 5, height: 5)
        stack.layer.shadowRadius = 8
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
        if textSpeak.text == speak?.level0[1].talk {
            delegate?.sendSpeakArray(speak: speak)
        }
        textSpeak.text = speak?.level0[1].talk
        speakButton.setTitle(speak?.level0[1].buttonLabel, for: .normal)
    }
    @objc func createActivity() {
        print("Tela de Criar Atividades")
    }
}

extension SpeakView: ViewCoding {

    func resetTextSettings() {
        textSpeak.text = speak?.level0[0].talk
        speakButton.setTitle(speak?.level0[0].buttonLabel, for: .normal)
    }

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


