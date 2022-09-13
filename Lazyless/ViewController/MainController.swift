//
//  MainController.swift
//  Lazyless
//
//  Created by Luiz Sena on 09/09/22.
//

import UIKit
import Lottie

class MainController: UIViewController {

    private let backgroundView: MainBackgroundView = MainBackgroundView()
    private var imageTeste: UIImageView = UIImageView(image: UIImage(named: preguicaModel.personaImageName))
    private var circularProgressBar: CircularProgressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 275, height: 275), lineWidth: 5, rounded: true)
    
    
    
    
    override func loadView() {
        
        super.loadView()
        
        self.view = backgroundView
        self.view.addSubview(imageTeste)
        self.view.addSubview(circularProgressBar)
        circularProgressBar.progressColor = .blue
        circularProgressBar.trackColor = .lightGray
        circularProgressBar.progress = 0.98
//        circularProgressBar.backgroundColor = .red
        circularProgressBar.translatesAutoresizingMaskIntoConstraints = false

        
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
            imageTeste.heightAnchor.constraint(equalTo: self.imageTeste.widthAnchor, multiplier: 0.85),
        ])
    }
}
