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

    private var srchRepoVM: RepositorySearchViewModel!
    private var disposeBag: DisposeBag!

    // MARK: - Init

    init(nibName: String, searchRepoVM: RepositorySearchViewModel, disposeBag: DisposeBag) {
        self.srchRepoVM = searchRepoVM
        self.disposeBag = disposeBag
        super.init(nibName: nibName, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.bind()
    }

    // MARK: - Actions

    private func bind() {

        // Bind searched repositories to tableView
       _ = srchRepoVM.repos.bind(to: tableView.rx.items(cellIdentifier: Keys.cell.rawValue, cellType: UITableViewCell.self)) { _, repo, cell in
            cell.textLabel?.text = repo.name
        }.disposed(by: disposeBag)

        // Set selc action for cell
        self.tableView.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
            do {
                let repositories = try self?.srchRepoVM.repos.value()
                guard let repository = repositories?[indexPath.row] else {
                    return
                }
                let repositoryController = RepositoryViewController(nibName: Controllers.repoVC, repository: repository)
                self?.navigationController?.pushViewController(repositoryController, animated: true)
            } catch {
                print("Error get repository")
            }

          }).disposed(by: disposeBag)
    }

    private func configureUI() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Keys.cell.rawValue)
        self.textField.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }

    @objc func textDidChange(_ textField: UITextField) {
        guard textField.text != "" else {
            // Clean repositories if textField is empty
            self.srchRepoVM.repos.onNext([])
            return }
        self.srchRepoVM.searhUsers(with: textField.text!)
    }
}
