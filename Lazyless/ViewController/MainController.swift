//
//  MainController.swift
//  Lazyless
//
//  Created by Luiz Sena on 09/09/22.
//

import UIKit
import Lottie

class MainController: UIViewController {
    
    private var amount: Int = 0
    
    private let cardActivityView: CardActivityView = CardActivityView()

    private var tableView: CustomTableViewController = {
        var tvc = CustomTableViewController()
        tvc.view.translatesAutoresizingMaskIntoConstraints = false
        return tvc
    }()

    private let backgroundView: MainBackgroundView = {
        let root = MainBackgroundView()
        return root
    }()

    private lazy var personaImage: UIImageView = {
        var imagev = UIImageView(image: UIImage(named: preguicaModel.personaImageName))
        imagev.translatesAutoresizingMaskIntoConstraints = false
        return imagev
    }()

    private var imageHeart: HeartView = {
        var heart = HeartView()
        heart.layer.shadowOpacity = 0.70
        heart.layer.shadowRadius = 8
        heart.layer.shadowOffset = CGSize(width: 0, height: 5)
        heart.translatesAutoresizingMaskIntoConstraints = false
        return heart
    }()

    private let speakView: SpeakView = {
        var speakView = SpeakView()
        speakView.translatesAutoresizingMaskIntoConstraints = false
        return speakView
    }()

    private let opaqueView: UIView = {
        var opaque = UIView()
        opaque.translatesAutoresizingMaskIntoConstraints = false
        opaque.backgroundColor = .black
        opaque.layer.opacity = 0.5
        return opaque
    }()

    override func loadView() {
        super.loadView()
        
        let tapGR = UITapGestureRecognizer(
            target: self,
            action: #selector(imageTapped)
        )
        
        personaImage.addGestureRecognizer(tapGR)
        personaImage.isUserInteractionEnabled = true
        
        buildLayout()
    }

}

extension MainController: ViewCoding {

    func setupHierarchy() {
        print(#function)
        self.addChild(tableView)
        self.view.addSubview(tableView.view!)
        self.view.addSubview(personaImage)
        self.view.addSubview(imageHeart)
        self.view.addSubview(cardActivityView)

        
    }

  

    func setupContrainsts() {

        imageHeart.contentMode = .scaleAspectFit
        personaImage.contentMode = .scaleAspectFit

        NSLayoutConstraint.activate([
            personaImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            personaImage.centerYAnchor.constraint(equalTo: self.backgroundView.rectBar.bottomAnchor, constant: -25),
            personaImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.60),
            personaImage.heightAnchor.constraint(equalTo: self.personaImage.widthAnchor),

            imageHeart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageHeart.centerYAnchor.constraint(equalTo: self.personaImage.bottomAnchor),
            imageHeart.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            imageHeart.heightAnchor.constraint(equalTo: self.imageHeart.widthAnchor),
            
            cardActivityView.topAnchor.constraint(equalTo: speakView.bottomAnchor, constant: 50),
            cardActivityView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/10),
            cardActivityView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            cardActivityView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)

//            speakView.topAnchor.constraint(equalTo: imageHeart.bottomAnchor),
//            speakView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            speakView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            tableView.view.topAnchor.constraint(equalTo: imageHeart.bottomAnchor, constant: 12),
            tableView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),

//            opaqueView.topAnchor.constraint(equalTo: view.topAnchor),
//            opaqueView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            opaqueView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            opaqueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    func setupView() {
        self.view = backgroundView
    }
    //  MARK: -objc funcs
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("UIImageView tapped")
            if amount == 0 {
                view.insertSubview(speakView, belowSubview: personaImage)
                view.insertSubview(opaqueView, belowSubview: speakView)
                NSLayoutConstraint.activate([
                    speakView.topAnchor.constraint(equalTo: imageHeart.bottomAnchor),
                    speakView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    speakView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                ])
                opaqueView.pin(to: view) //Contraints
            }else if amount < 5 {
                print(amount)
            }
            else if amount == 5 {
                opaqueView.removeFromSuperview()
                speakView.removeFromSuperview()
                amount = -2
            }
            amount += 1
        }
    }
}
