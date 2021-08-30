//
//  UserSearchViewController.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class RepositorySearchViewController: UIViewController {

    // MARK: - @IBOutlets + views

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!

    // MARK: - Variables

    var searchUsersViewModel: RepositorySearchViewModel!
    var disposeBag =  DisposeBag()

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.bind()
    }

    // MARK: - Actions

    private func bind() {
        // Bind searched repositories to tableView
        _ = searchUsersViewModel.repositories.bind(to: tableView.rx.items(cellIdentifier: Keys.cell.rawValue, cellType: UITableViewCell.self)) { _, repo, cell in

            cell.textLabel?.text = repo.name

        }.disposed(by: disposeBag)
    }

    private func configureUI() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Keys.cell.rawValue)
        self.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }

    @objc func textDidChange(_ textField: UITextField) {
        guard textField.text != "" else {
            // Clean repositories if textField is empty
            self.searchUsersViewModel.repositories.onNext([])
            return }
        self.searchUsersViewModel.searhUsers(with: textField.text!)
    }
}
