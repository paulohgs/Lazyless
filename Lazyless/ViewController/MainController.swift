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
    private let speakView: SpeakView = SpeakView()
    private let cardActivityView: CardActivityView = CardActivityView()
    private let tableView: CustomTableViewController = CustomTableViewController()
    private lazy var viewTabelView = tableView.view

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
        self.addChild(tableView)
        self.view.addSubview(personaImage)
        self.view.addSubview(imageHeart)
        self.view.addSubview(cardActivityView)
        self.view.addSubview(speakView)
//        self.view.addSubview(viewTabelView!)
    }

    func setupContrainsts() {
        personaImage.translatesAutoresizingMaskIntoConstraints = false
        imageHeart.translatesAutoresizingMaskIntoConstraints = false
        speakView.translatesAutoresizingMaskIntoConstraints = false
        cardActivityView.translatesAutoresizingMaskIntoConstraints = false
//        viewTabelView?.translatesAutoresizingMaskIntoConstraints = false


        imageHeart.contentMode = .scaleAspectFit
        personaImage.contentMode = .scaleAspectFit


        NSLayoutConstraint.activate([
            personaImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            personaImage.centerYAnchor.constraint(equalTo: self.backgroundView.rectBar.bottomAnchor, constant: -25),
            personaImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.50),
            personaImage.heightAnchor.constraint(equalTo: self.personaImage.widthAnchor),


            imageHeart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageHeart.centerYAnchor.constraint(equalTo: self.personaImage.bottomAnchor),
            imageHeart.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15),
            imageHeart.heightAnchor.constraint(equalTo: self.imageHeart.widthAnchor),

            speakView.topAnchor.constraint(equalTo: imageHeart.bottomAnchor),
            speakView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            cardActivityView.topAnchor.constraint(equalTo: speakView.bottomAnchor, constant: 50),
            cardActivityView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/10),
            cardActivityView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            cardActivityView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)

//            speakView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2.5),
            speakView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            speakView.leadingAnchor.constraint(equalTo: view.leadingAnchor),

//            viewTabelView!.topAnchor.constraint(equalTo: speakView.bottomAnchor, constant: 20),
//            viewTabelView!.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            viewTabelView!.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            viewTabelView!.leadingAnchor.constraint(equalTo: view.leadingAnchor),
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

