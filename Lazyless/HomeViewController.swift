//
//  HomeViewController.swift
//  Lazyless
//
//  Created by Paulo Henrique Gomes da Silva on 05/09/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        constraints()
    }
    
    
    func addSubviews() {
        view.addSubview(helloLabel)
    }
    
    private func constraints() {

        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
