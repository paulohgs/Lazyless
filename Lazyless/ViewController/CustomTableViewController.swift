//
//  CustomTableViewController.swift
//  Lazyless
//
//  Created by Luiz Sena on 20/09/22.
//

import UIKit

class CustomTableViewController: UIViewController {

    private lazy var tableViewController: UITableView = {
        let tvc = UITableView(frame: .zero, style: .plain)
        tvc.backgroundColor = UIColor(named: "bgColor")
        return tvc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
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
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = CustomTableViewCell()
        cell.backgroundColor = UIColor(named: "bgColor")
        return cell
    }


}


