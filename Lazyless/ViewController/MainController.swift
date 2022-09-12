//
//  MainController.swift
//  Lazyless
//
//  Created by Luiz Sena on 09/09/22.
//

import UIKit

class MainController: UIViewController {

    private let backgroundView: MainBackgroundView = MainBackgroundView()
    private var imageTeste: UIImageView = UIImageView(image: UIImage(named: preguicaModel.personaImageName))
    
    
    
    override func loadView() {
        
        super.loadView()
        
        self.view = backgroundView
        self.view.addSubview(imageTeste)
        
        imageTeste.contentMode = .scaleAspectFit
//        imageTeste.backgroundColor = .blue
        
        imageTeste.translatesAutoresizingMaskIntoConstraints = false
        constraints()
        
        
    }
    func constraints(){
        NSLayoutConstraint.activate([
            imageTeste.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageTeste.topAnchor.constraint(equalToSystemSpacingBelow: self.view.topAnchor, multiplier: 3),
            imageTeste.widthAnchor.constraint(equalTo: view.widthAnchor ,multiplier: 0.75),
            imageTeste.heightAnchor.constraint(equalTo: self.imageTeste.widthAnchor, multiplier: 0.85)
        ])
    }
}
