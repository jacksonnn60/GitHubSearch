//
//  RepositoryViewControlle.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import UIKit

final class RepositoryViewController: UIViewController {

    // MARK: - @IBOutlets

    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabele: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!

    // MARK: - Variables

    private let repository: Repository

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
        navigationController?.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Actions

    private func configureUI() {
       repositoryNameLabel.text = "Repository Name: \(repository.name)"
       ownerLabel.text = "Owner: \(repository.owner.login)"
       descriptionLabel.text = repository.repositoryDescription ?? "--"
       watchersLabel.text = "Watchers: \(repository.watchers ?? 0)"
       languageLabele.text = "Language: \(repository.language)"
    }
}
