//
//  HomeViewController.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 05/09/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var box: UIView = {
        let box = UIView()
        box.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        box.backgroundColor = UIColor(named: "header")
        box.translatesAutoresizingMaskIntoConstraints = false
        return box
    }()
    
    private lazy var box2: UIView = {
        let box = UIView()
        box.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        box.backgroundColor = UIColor(named: "bg")
        box.translatesAutoresizingMaskIntoConstraints = false
        return box2
    }()
    
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = UIColor(named: "mainColors")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bg")
        addSubviews()
        constraints()
    }
    
    func addSubviews() {
        view.addSubview(helloLabel)
        view.addSubview(box)
//        view.addSubview(box2)
    }
    
    private func constraints() {

        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
}
