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
        textField.backgroundColor = .systemBackground
        //parece magica
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
    
    private lazy var headerTextInput: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Nome da atividade"
        return header
    }()
    
    private var footerSlider: UILabel = {
        let footer = UILabel()
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.text = "Mostra a aprioridade da atividade pelos pontos"
        footer.textColor = .systemGray
        return footer
    }()
    
    private var headerSlider: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Pontos de afetividade"
        return header
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
        view.backgroundColor = UIColor(named: "cardColor")
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
        
        NSLayoutConstraint.activate([
            headerTextInput.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerTextInput.bottomAnchor.constraint(equalTo: self.myfield.topAnchor, constant: -5),
            headerTextInput.leadingAnchor.constraint(equalTo: self.myfield.leadingAnchor, constant: 10),
            headerTextInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            footerSlider.topAnchor.constraint(equalTo: self.slider.bottomAnchor, constant: 5),
            footerSlider.leadingAnchor.constraint(equalTo: self.headerTextInput.leadingAnchor, constant: 0),
            footerSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            headerSlider.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -5),
            headerSlider.leadingAnchor.constraint(equalTo: headerTextInput.leadingAnchor),
            headerSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    func setupHierarchy() {
        view.addSubview(myfield)
        view.addSubview(slider)
        view.addSubview(headerTextInput)
        view.addSubview(footerSlider)
        view.addSubview(headerSlider)
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

