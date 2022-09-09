//
//  MainController.swift
//  Lazyless
//
//  Created by Luiz Sena on 09/09/22.
//

import UIKit

class MainController: UIViewController {

    private let background: MainBackgroundView = MainBackgroundView()

    override func loadView() {
        super.loadView()
        self.view = background
    }

}
