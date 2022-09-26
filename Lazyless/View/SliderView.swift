//
//  SliderVIew.swift
//  Lazyless
//
//  Created by Lucas Barbosa de Oliveira on 19/09/22.
//

import UIKit

class SliderView: UIView {
    
    private lazy var slider: UISlider = {
//        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 150, height: 200))
        let slider = UISlider(frame: .zero)
//        let minSlider = UILabel?.self
//        let maxSlider = UILabel?.self
//        let totalSlider = UILabel?.self
//        let actualSlider = UILabel?
        slider.center = self.center
        slider.minimumValue = 10
        slider.maximumValue = 50
        slider.value = 10
        slider.tintColor = UIColor(named: "secondColor")
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        slider.addTarget(self, action:
                            #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        
        return slider
    }()
    
    var sliderValue: Float {
        slider.value
    }
    
//    func sliderChanged(_ sender: UISlider ) {
//        let sliderValue = sliderView.value
//        label.text = String(sliderValue)
//    }
    private let total: UILabel = {
        let total = UILabel()
        total.translatesAutoresizingMaskIntoConstraints = false
        total.text = "Total"
        return total
    }()
    
    private let totalAtual: UILabel = {
        let totalAtual = UILabel()
        totalAtual.translatesAutoresizingMaskIntoConstraints = false
        totalAtual.textColor = .systemGray
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
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        
        
        // Use this code below only if you want UISlider to snap to values step by step
        let roundedStepValue = round(sender.value / 5) * 5
        sender.value = roundedStepValue
        
        totalAtual.text = String(Int(roundedStepValue))
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SliderView: ViewCoding {
    func setupView() {
        self.backgroundColor = UIColor(named: "cardColor")
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
            total.topAnchor.constraint(equalTo: self.topAnchor, constant:  13),
            total.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            total.heightAnchor.constraint(equalToConstant: 20),
            total.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
//            total.widthAnchor.constraint(equalToConstant: 20),
            
            totalAtual.topAnchor.constraint(equalTo: self.topAnchor, constant:  13),
            totalAtual.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 376),
            totalAtual.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 30),
            totalAtual.heightAnchor.constraint(equalToConstant: 20),
            
            minimo.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
            minimo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            minimo.trailingAnchor.constraint(equalTo: slider.leadingAnchor),
            minimo.heightAnchor.constraint(equalToConstant: 20),
            
            maximo.centerYAnchor.constraint(equalTo: slider.centerYAnchor),
            maximo.leadingAnchor.constraint(equalTo: slider.trailingAnchor, constant: 10),
            maximo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            maximo.heightAnchor.constraint(equalToConstant: 20),
            
            slider.topAnchor.constraint(equalTo: total.bottomAnchor, constant:  20),
            slider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            slider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            slider.heightAnchor.constraint(equalToConstant: 10)
            
        ])
        
    }
}
