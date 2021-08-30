//
//  ViewController.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ToDoViewController: UIViewController {

    // MARK: - @IBoutlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Variables

    private var toDoViewModel: ToDoViewModel!
    private var dBag: DisposeBag!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        self.config()
        self.bind()
    }

    // MARK: - Actions

    private func bind() {
        _ = self.toDoViewModel.toDoImtems.bind(to: self.tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { _, item, cell in

            // add name of toDoItem to the cell
            cell.textLabel?.text = item.name

        }.disposed(by: dBag)
    }

    private func config() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.toDoViewModel = ToDoViewModel()
        self.dBag = DisposeBag()
        // navigation items
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(addItem))
    }

    @objc private func addItem() {
        let alertVC = UIAlertController(title: "Add new item", message: nil, preferredStyle: .alert)
        alertVC.addTextField { textField in
            textField.placeholder = "Item name"
        }
        alertVC.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
            guard let name = alertVC.textFields?[0].text else { return }
            self.toDoViewModel.addItem(name: name)
        }))
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

