//
//  CardActivityView.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 19/09/22.
//

import UIKit

class CardActivityView: UIView {
    
    private var isChecked: Bool = false
    
    private lazy var activityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome da atividade"
        label.textColor = UIColor(named: "darkGrey")
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    private lazy var pontuacaoLabel: UILabel = {
        let pontuacao: Int = 0
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pontuação: \(pontuacao)"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var checkboxButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemGray2
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(toggle) , for: .touchDown)
        button.layer.borderColor = UIColor.systemGray2.cgColor
        button.layer.borderWidth = 1.5
        return button
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func toggle() {
        self.isChecked = !isChecked
        
        if self.isChecked {
            checkboxButton.backgroundColor = UIColor(named: "secondColor")
        } else {
            checkboxButton.backgroundColor = UIColor.systemGray2
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
        self.addSubview(activityLabel)
        self.addSubview(pontuacaoLabel)
        self.addSubview(checkboxButton)
    }
    
    func setupContrainsts() {
        NSLayoutConstraint.activate([
            // Constraints do texto da atividae
            activityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            activityLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -5),
            activityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            
            // Constraints da pontuacao
            pontuacaoLabel.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 5),
            pontuacaoLabel.leadingAnchor.constraint(equalTo: activityLabel.leadingAnchor),
            pontuacaoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            
            // Constraints do botao
            checkboxButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            checkboxButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            checkboxButton.heightAnchor.constraint(equalToConstant: 35),
            checkboxButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
}
