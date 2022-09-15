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
    private var personaImage: UIImageView = UIImageView(image: UIImage(named: preguicaModel.personaImageName))
//    private var imageHeart: UIImageView = UIImageView(image: UIImage(named: preguicaModel.heartImageName))
    private var imageHeart: HeartView = HeartView()
    //    private var circularProgressBar: CircularProgressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 250, height: 250), lineWidth: 5, rounded: true)

    override func loadView() {
        super.loadView()
        //        circularProgressBar.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGR = UITapGestureRecognizer(
            target: self,
            action: #selector(imageTapped)
        )
        personaImage.addGestureRecognizer(tapGR)
        personaImage.isUserInteractionEnabled = true

        // MARK: -Barra de progresso circular config
        //        circularProgressBar.progressColor = .blue
        //        circularProgressBar.trackColor = .lightGray
        //        circularProgressBar.progress = 0.98
        // MARK: -----------------------------------------------
        
        buildLayout()
    }
}

extension MainController: ViewCoding {


    func setupHierarchy() {
        
        self.view.addSubview(personaImage)
        self.view.addSubview(imageHeart)
    }

    func setupContrainsts() {
        personaImage.translatesAutoresizingMaskIntoConstraints = false
        imageHeart.translatesAutoresizingMaskIntoConstraints = false

        imageHeart.contentMode = .scaleAspectFit
        personaImage.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            personaImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            personaImage.topAnchor.constraint(equalToSystemSpacingBelow: self.view.topAnchor, multiplier: 3),
            personaImage.widthAnchor.constraint(equalTo: view.widthAnchor ,multiplier: 0.75),
            personaImage.heightAnchor.constraint(equalTo: self.personaImage.widthAnchor, multiplier: 0.85),


            imageHeart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageHeart.centerYAnchor.constraint(equalTo: self.personaImage.bottomAnchor),
            imageHeart.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            imageHeart.heightAnchor.constraint(equalTo: self.imageHeart.widthAnchor),

        ])
    }
    func setupView() {
        self.view = backgroundView
    }
    //  MARK: -objc funcs
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("UIImageView tapped")
        }
    }

}
