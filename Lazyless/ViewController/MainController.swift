//
//  MainController.swift
//  Lazyless
//
//  Created by Luiz Sena on 09/09/22.
//

import UIKit
import Lottie

class MainController: UIViewController {
    
    private lazy var tableView: CustomTableViewController = {
        var tvc = CustomTableViewController(delegate: self)
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

    private let circularProgressBar: CircularProgressView = {
        let circularProgressBar = CircularProgressView(frame: .zero, lineWidth: 15, rounded: true)
        circularProgressBar.translatesAutoresizingMaskIntoConstraints = false
        circularProgressBar.progressColor = .systemPink
        circularProgressBar.trackColor = UIColor(red: 255/255, green: 230/255, blue: 240/255, alpha: 1)
        circularProgressBar.progress = 0
        circularProgressBar.backgroundColor = .red.withAlphaComponent(0.5)
        return circularProgressBar
    }()

    private lazy var imageHeart: HeartView = {
        var heart = HeartView()
        heart.layer.shadowOpacity = 0.70
        heart.layer.shadowRadius = 8
        heart.layer.shadowOffset = CGSize(width: 0, height: 5)
        heart.translatesAutoresizingMaskIntoConstraints = false
        return heart
    }()
    
    private var speakView: SpeakView = {
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

    private var activityController: ActivityViewController = {
        let controller = ActivityViewController()
        return controller
    }()
    
    override func loadView() {
        super.loadView()

        speakView.delegate = self
        
        let personaImageTap = UITapGestureRecognizer(
            target: self,
            action: #selector(imageTapped)
        )
        
        let opaqueViewTap = UITapGestureRecognizer(
            target: self,
            action: #selector(touchedOpaqueView)
        )
        
        opaqueView.addGestureRecognizer(opaqueViewTap)
        opaqueView.isUserInteractionEnabled = true
        personaImage.addGestureRecognizer(personaImageTap)
        personaImage.isUserInteractionEnabled = true
        
        buildLayout()
    }
}

extension MainController: ViewCoding {
    
    func setupHierarchy() {
        self.addChild(tableView)
        self.view.addSubview(circularProgressBar)
        self.view.addSubview(tableView.view!)
        self.view.addSubview(personaImage)
        self.view.addSubview(imageHeart)
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
            
            tableView.view.topAnchor.constraint(equalTo: imageHeart.bottomAnchor, constant: 12),
            tableView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            circularProgressBar.centerXAnchor.constraint(equalTo: self.personaImage.centerXAnchor),
            circularProgressBar.centerYAnchor.constraint(equalTo: self.personaImage.centerYAnchor),
            circularProgressBar.widthAnchor.constraint(equalTo: self.personaImage.widthAnchor, multiplier: 0.98),
            circularProgressBar.heightAnchor.constraint(equalTo: self.personaImage.heightAnchor, multiplier: 0.98),
        ])
    }
    func setupView() {
        self.view = backgroundView
    }

    //  MARK: -objc funcs

    @objc func touchedOpaqueView (sender: UITapGestureRecognizer){
        if sender.state == .ended {
            opaqueView.removeFromSuperview()
            speakView.removeFromSuperview()
            speakView.resetTextSettings()
        }
    }
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            view.insertSubview(speakView, belowSubview: personaImage)
            view.insertSubview(opaqueView, belowSubview: speakView)

            NSLayoutConstraint.activate([
                speakView.topAnchor.constraint(equalTo: imageHeart.bottomAnchor),
                speakView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                speakView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
            opaqueView.pin(to: view) //Contraints 
        }
    }
}

extension MainController: SpeakDelegate {
    func isCancelButtonTouched(touch: Bool){
        speakView.removeFromSuperview()
        opaqueView.removeFromSuperview()
        speakView.resetTextSettings()
    }

    func isActivityButtonTouched(touch: Bool) {
        if touch {
            speakView.removeFromSuperview()
            opaqueView.removeFromSuperview()
//            present(
//                activityController,
//                animated: true,
//                completion: {
//                    self.speakView.resetTextSettings()
//                }
//            )
           
            activityController.delegate = tableView
            navigationController?.pushViewController(activityController, animated: true)
            
        }
    }
}

extension MainController: AffinityDelegate {
    func incrementProgress(value: Float) {
        circularProgressBar.progress += CGFloat(value/100)
    }
}
