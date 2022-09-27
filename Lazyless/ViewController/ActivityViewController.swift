import UIKit
import SwiftUI

class ActivityViewController: UIViewController {
    
    weak var delegate: ActivityToTableViewDelegate?

    //Componentes
    private lazy var myfield: UITextField = {
        let textField = UITextField()
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = " Ex: Beber 1500ml de água"
        textField.textColor = UIColor(named: "textColor")
        
        //Basic texfield Setup
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(named: "cardColor")

        //To apply corner radius
//        textField.layer.cornerRadius = textField.frame.size.height / 2
        textField.layer.cornerRadius = 18
        textField.layer.masksToBounds = true

        //To apply border
        textField.layer.borderWidth = 0.25
        textField.layer.borderColor = UIColor.white.cgColor

        //To apply Shadow
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 3.0
        textField.layer.shadowOffset = CGSize.zero
        textField.layer.shadowColor = UIColor.gray.cgColor

        //To apply padding
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always

        return textField
    }()
    
    private lazy var slider: SliderView = {
        let slider = SliderView()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Crie sua Atividade"

        configureItems()
        buildLayout()
    }

    private func configureItems(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (title: "Confirmar", style: .done, target: self, action: #selector(saveActivity))
    }
}

extension ActivityViewController: ViewCoding {
    func setupView() {
        view.backgroundColor = UIColor(named: "bgColor")
    }
    
    func setupContrainsts() {
        NSLayoutConstraint.activate([
            self.myfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height/20),
            self.myfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: view.bounds.width/40),
            self.myfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -view.bounds.width/40),
            self.myfield.heightAnchor.constraint(equalToConstant: view.bounds.height*0.05)
        ])
        NSLayoutConstraint.activate([
            slider.topAnchor.constraint(equalTo: self.myfield.bottomAnchor, constant: 50),
            slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: view.bounds.width/40),
            slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -view.bounds.width/40),
            slider.heightAnchor.constraint(equalToConstant: view.bounds.height*0.10),
        ])
    }
    
    func setupHierarchy() {
        view.addSubview(myfield)
        view.addSubview(slider)
    }
    
    @objc func saveActivity() {
        //
//        print(myfield.text ?? "erro")
        delegate?.createActivity(text: myfield.text!, value: slider.sliderValue)
//        print(slider.sliderValue)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
}

