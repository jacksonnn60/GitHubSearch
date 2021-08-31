//
//  RepositoryViewControlle.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import UIKit

class RepositoryViewController: UIViewController {

    // MARK: - @IBOutlets

    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabele: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!

    // MARK: - Variables

    private var repository: Repository?

    // MARK: - Init

    init(nibName: String, repository: Repository) {
        self.repository = repository
        super.init(nibName: nibName, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }

    // MARK: - Actions

    private func configureUI() {
        guard let repo = repository else { return }
        self.repositoryNameLabel.text = "Repository Name: \(repo.name)"
        self.ownerLabel.text = "Owner: \(repo.owner.login)"
        self.descriptionLabel.text = repo.description ?? "--"
        self.watchersLabel.text = "Watchers: \(repo.watchers ?? 0)"
        self.languageLabele.text = "Language: \(repo.language)"
    }
}
