//
//  CardActivityView.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 19/09/22.
//

import UIKit

class CardActivityView: UIView {
    
    var delegate: AffinityDelegate?
    
    var cardTitle: String
    var pontuation: Float
    private var isChecked: Bool = false
    
    private lazy var activityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = cardTitle
        label.textColor = UIColor(named: "darkGrey")
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var pontuacaoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pontuação: \(String(Int(pontuation)))"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var checkboxButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemGray5
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(toggle) , for: .touchDown)
        return button
    }()
    
    init(cardTitle: String, pontuation: Float) {
        self.pontuation = pontuation
        self.cardTitle = cardTitle
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func toggle() {
        self.isChecked = !isChecked
        
        if self.isChecked {
            let feedback = UISelectionFeedbackGenerator()
            checkboxButton.backgroundColor = UIColor(named: "secondColor")
            delegate?.incrementProgress(value: pontuation)
            feedback.selectionChanged()

        } else {
            checkboxButton.backgroundColor = UIColor.systemGray5
        }
    }

}

extension CardActivityView: ViewCoding {
    func setupView() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
    func setupHierarchy() {
        self.addSubview(checkboxButton)
        self.addSubview(activityLabel)
        self.addSubview(pontuacaoLabel)
    }
    
    func setupContrainsts() {
        NSLayoutConstraint.activate([
            // Constraints do botao
            checkboxButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            checkboxButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkboxButton.heightAnchor.constraint(equalToConstant: 35),
            checkboxButton.widthAnchor.constraint(equalToConstant: 35),

            // Constraints do texto da atividae
            activityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            activityLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            activityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            activityLabel.trailingAnchor.constraint(equalTo: checkboxButton.leadingAnchor),
            
            // Constraints da pontuacao
            pontuacaoLabel.topAnchor.constraint(equalTo: activityLabel.bottomAnchor),
            pontuacaoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            pontuacaoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            pontuacaoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
