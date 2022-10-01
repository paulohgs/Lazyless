//
//  CustomTableViewController.swift
//  Lazyless
//
//  Created by Luiz Sena on 20/09/22.
//

import UIKit

class CustomTableViewController: UIViewController {
    
    private var activityVC: ActivityViewController = ActivityViewController()
    private var text: String = "erro"
    private var value: Float = 0.0
    private lazy var lista: [CustomTableViewCell] = []
    
    weak var affinityDelegate: AffinityDelegate! // guarda instancia de main controller
    
    init(delegate: AffinityDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.affinityDelegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let nothingLabel: UILabel = {
        let label = UILabel()
//        label.text = "Não Tem Nada Meu Amor!!"
        label.text = "Não há nenhuma atividade!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Arial", size: UIScreen.main.bounds.width/11.5)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tableViewController: UITableView = {
        let tvc = UITableView(frame: .zero, style: .plain)
        tvc.backgroundColor = UIColor(named: "bgColor")
        tvc.allowsSelection = false
        return tvc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        activityVC.delegate = self
        
    }

    func configureTableView() {
        view.addSubview(tableViewController)
        setTableViewDelegate()
        doConstraints()

        if lista.isEmpty {
            view.addSubview(nothingLabel)
            NSLayoutConstraint.activate([
                nothingLabel.centerXAnchor.constraint(equalTo: tableViewController.centerXAnchor),
                nothingLabel.centerYAnchor.constraint(equalTo: tableViewController.centerYAnchor, constant: -100),
                nothingLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/1.4)
            ])
        }
    }

    func setTableViewDelegate() {
        tableViewController.delegate = self
        tableViewController.dataSource = self
    }

    func doConstraints() {
        tableViewController.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewController.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewController.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewController.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewController.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lista.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = lista[indexPath.row]
        cell.cardActivity?.delegate = affinityDelegate
        cell.backgroundColor = UIColor(named: "bgColor")
        return cell
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete{
            tableView.beginUpdates()
            lista.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }

    }

}

extension CustomTableViewController: ActivityToTableViewDelegate {
    func createActivity(text: String, value: Float) {
        // criar
        // recarregar a tableview
        let cell = CustomTableViewCell(titleCard: text, pontuationValue: value)
        lista.append(cell)
        tableViewController.reloadData()
        if lista.isEmpty == false {
            nothingLabel.removeFromSuperview()
        }
    }
}
