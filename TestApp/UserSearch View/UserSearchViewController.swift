//
//  UserSearchViewController.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import UIKit


class UserSearchViewController: UIViewController {

    // MARK: - @IBOutlets + views

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }

    // MARK: - Actions

    private func configureUI() {
        self.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }

    @objc func textDidChange(_ textField: UITextField) {
        guard textField.text?.count != 0 else { return }
    }
}

