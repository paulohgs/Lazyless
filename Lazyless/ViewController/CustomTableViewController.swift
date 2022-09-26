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
        cell.backgroundColor = UIColor(named: "bgColor")
        return cell
    }

}

extension CustomTableViewController: ActivityToTableViewDelegate {
    func createActivity(text: String, value: Float) {
        // criar
        // recarregar a tableview
        let cell = CustomTableViewCell(titleCard: text, pontuationValue: value)
        lista.append(cell)
        tableViewController.reloadData()
    }
}
