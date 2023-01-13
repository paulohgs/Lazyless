//
//  SliderVIew.swift
//  Lazyless
//
//  Created by Lucas Barbosa de Oliveira on 19/09/22.
//

import UIKit

class SliderView: UIView {
    
    private var headerSlider: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Pontos de afetividade"
        return header
    }()
    
    private lazy var slider: UISlider = {
        let slider = UISlider(frame: .zero)
        
        slider.center = self.center
        slider.minimumValue = 10
        slider.maximumValue = 50
        slider.value = 30
        slider.tintColor = UIColor(named: "secondColor")
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.addTarget(self, action:
                            #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        return slider
    }()
    
    var sliderValue: Float {
        slider.value
    }
    
    private let total: UILabel = {
        let total = UILabel()
        total.translatesAutoresizingMaskIntoConstraints = false
        total.text = "Total"
        return total
    }()
    
    private let totalAtual: UILabel = {
        let totalAtual = UILabel()
        totalAtual.translatesAutoresizingMaskIntoConstraints = false
        totalAtual.text = "10"
        
        return totalAtual
    }()
    
    private let maximo: UILabel = {
        let max = UILabel()
        max.translatesAutoresizingMaskIntoConstraints = false
        max.text = "50"
        return max
    }()
    
    private let minimo: UILabel = {
        let min = UILabel()
        min.translatesAutoresizingMaskIntoConstraints = false
        min.text = "10"
        return min
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: Objc functions
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        // Use this code below only if you want UISlider to snap to values step by step
        let roundedStepValue = round(sender.value / 5) * 5
        sender.value = roundedStepValue

        totalAtual.text = String(Int(roundedStepValue))
    }
}

//MARK: Extension ViewCoding
extension SliderView: ViewCoding {
    func setupView() {
        self.backgroundColor = UIColor(named: "mainColor")
        self.layer.cornerRadius = 18
    }
    
    func setupHierarchy() {
        self.addSubview(slider)
        self.addSubview(total)
        self.addSubview(totalAtual)
        self.addSubview(maximo)
        self.addSubview(minimo)
    }
    
    func setupContrainsts() {
        NSLayoutConstraint.activate([
            // total constraints
            total.topAnchor.constraint(equalTo: self.topAnchor, constant:  13),
            total.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            total.heightAnchor.constraint(equalToConstant: 20),
            // totalAtual constraints
            totalAtual.topAnchor.constraint(equalTo: self.topAnchor, constant:  13),
            totalAtual.leadingAnchor.constraint(equalTo: total.trailingAnchor),
            totalAtual.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            totalAtual.heightAnchor.constraint(equalToConstant: 20),
            // minimo constraints
            minimo.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
            minimo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            minimo.trailingAnchor.constraint(equalTo: slider.leadingAnchor),
            minimo.heightAnchor.constraint(equalToConstant: 20),
            // maximo constraints
            maximo.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
            maximo.leadingAnchor.constraint(equalTo: slider.trailingAnchor, constant: 10),
            maximo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            maximo.heightAnchor.constraint(equalToConstant: 20),
            // slider constraints
            slider.topAnchor.constraint(equalTo: total.bottomAnchor, constant:  20),
            slider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            slider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            slider.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
}
