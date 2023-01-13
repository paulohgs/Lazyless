//
//  ActivityView.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 04/10/22.
//

import UIKit

class ActivityView: UIView {
    
    //Componentes
    lazy var activityFieldText: UITextField = {
        let textField = UITextField()
        let paddingView : UIView = UIView(
            frame: CGRect(x: 0,
                          y: 0,
                          width: 10,
                          height: textField.frame.height)
        )
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ex: Beber 1500ml de água"
        //Basic texfield Setup
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(named: "mainColor")
        //To apply corner radius
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        //To apply Shadow
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 3.0
        textField.layer.shadowOffset = CGSize.zero
        textField.layer.shadowColor = UIColor.gray.cgColor
        //To apply padding
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
        return textField
    }()
    
    private lazy var activityTextLabel: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Nome da atividade"
        header.font = .systemFont(ofSize: 24)
        return header
    }()
    
    lazy var sliderView: SliderView = {
        let slider = SliderView()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ActivityView: ViewCoding {
    func setupView() {
        self.backgroundColor = UIColor(named: "bgColor")
    }
    
    func setupHierarchy() {
        // setup view
        self.addSubview(activityTextLabel)
        self.addSubview(activityFieldText)
        self.addSubview(sliderView)
    }
    
    func setupContrainsts() {
        // constraints
        NSLayoutConstraint.activate([
            // constraints label
            activityTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            activityTextLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            //constraints textField
            activityFieldText.topAnchor.constraint(equalTo: activityTextLabel.bottomAnchor, constant: 10),
            activityFieldText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            activityFieldText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            activityFieldText.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
//            // constraints slider
            sliderView.topAnchor.constraint(equalTo: activityFieldText.bottomAnchor, constant: 20),
            sliderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            sliderView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            sliderView.heightAnchor.constraint(equalToConstant: self.bounds.height*0.1),
        ])
    }
}
