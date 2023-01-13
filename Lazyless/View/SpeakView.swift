//
//  SpeakView.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 12/09/22.
//

import UIKit

class SpeakView: UIView {

    weak var delegate: SpeakDelegate?
    var level: Int
    
    private lazy var speaks: [SpeakModel] = ReadJsonDatabase().loadJson() ?? []
    private lazy var arrayViews: [UIView] = [title, textSpeak, speakButton, cancelButton]

    func speakModel(for id: Int) -> SpeakModel? {
        speaks.first(where: {
            $0.id == id
        })
    }
    
    // Injetar o personaName via init
    var personaName: String = ""
    private lazy var title: UILabel = {
        var label = UILabel()
        label.text = personaName
        label.textAlignment = .left
        label.textColor = UIColor(named: "titleColor")
        label.font = UIFont.systemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textSpeak: UILabel = {
        var label = UILabel()
        label.text = speakModel(for: level)?.levelModels[0].talk ?? ""
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
        configuration.title = speakModel(for: level)?.levelModels[0].buttonLabel ?? ""// speak?.level0[0].buttonLabel
        configuration.baseForegroundColor = UIColor(named: "darkGrey")
        configuration.baseBackgroundColor = UIColor(named: "secondColor")
        button.configuration = configuration
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(actionButton), for: .touchDown)
        return button
    }()
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var configuration = UIButton.Configuration.borderedProminent()
        configuration.baseBackgroundColor = .clear
        configuration.baseForegroundColor = .systemGray
        button.configuration = configuration
        button.configuration?.title = "Cancelar"
        button.addTarget(self, action: #selector(cancel), for: .touchDown)
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
    
    init(personaName: String, level: Int) {
        self.level = level
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
        self.personaName = personaName
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - objc funcs
    
    @objc func actionButton() {
        if textSpeak.text == speakModel(for: level)?.levelModels[1].talk ?? "" {
            delegate?.isActivityButtonTouched(touch: true)
        }
        textSpeak.text = speakModel(for: level)?.levelModels[1].talk
        speakButton.setTitle(speakModel(for: level)?.levelModels[1].buttonLabel, for: .normal)
    }

    @objc func cancel(){
        delegate?.isCancelButtonTouched(touch: true)
    }
}

extension SpeakView: ViewCoding {

    func resetTextSettings() {
        textSpeak.text = speakModel(for: level)?.levelModels[1].talk
        speakButton.setTitle(speakModel(for: level)?.levelModels[1].buttonLabel, for: .normal)
    }

    func setupView() {
        // setup this view
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
        self.addSubview(stackView)
    }
}


