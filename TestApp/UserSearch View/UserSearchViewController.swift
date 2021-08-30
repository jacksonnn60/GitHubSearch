//
//  UserSearchViewController.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class UserSearchViewController: UIViewController {

    // MARK: - @IBOutlets + views

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!

    // -
    var searchUsersViewModel: UserSearchViewModel!
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
        let _ = self.searchUsersViewModel.repositories.bind(to: self.tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { _, repo, cell in

            cell.textLabel?.text = repo.name

        }.disposed(by: disposeBag)
    }

    private func configureUI() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }

    @objc func textDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        self.searchUsersViewModel.searhUsers(with: text)
    }
}
