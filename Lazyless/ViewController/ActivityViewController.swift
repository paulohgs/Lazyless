import UIKit
import SwiftUI

class ActivityViewController: UIViewController {
    
    weak var delegate: ActivityToTableViewDelegate?
    
    private let activityView = ActivityView()

    override func loadView() {
        view = activityView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Crie sua Atividade"
        configureItems()
    }

    private func configureItems(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (title: "Confirmar", style: .done, target: self, action: #selector(saveActivity))
    }

    @objc func saveActivity() {
        delegate?.createActivity(text: activityView.activityFieldText.text!, value: activityView.sliderView.sliderValue)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
}
