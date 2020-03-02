//
//  MatchHistoryViewController.swift
//  RoadToRLCS
//
//  Created by Roberto Manese III on 2/15/20.
//  Copyright © 2020 jawnyawn. All rights reserved.
//

import UIKit

class MatchHistoryViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var presenter: MatchHistoryPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newGame))

        tableView.register(UINib(nibName: "\(MatchHistoryTableCell.self)", bundle: nil), forCellReuseIdentifier: "ID")
        tableView.dataSource = presenter
        tableView.delegate = self
    }

    @objc func newGame() {
        let model = NewGameModel()
        let vc = NewGameViewController()
        let presenter = NewGamePresenter(model: model, view: vc)
        vc.presenter = presenter
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension MatchHistoryViewController: MatchHistoryListType {
    
}
