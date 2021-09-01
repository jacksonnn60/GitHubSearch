//
//  UserSearchViewModel.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import Foundation
import RxCocoa
import RxSwift

protocol IRepositorySearchViewModel {
    var repos: BehaviorSubject<[Repository]> { get set }

    func searhUsers(with name: String)
}

final class RepositorySearchViewModel: IRepositorySearchViewModel {
    var repos = BehaviorSubject<[Repository]>.init(value: [])

    func searhUsers(with name: String) {
        RepositoryDataProvider.searchRepos(by: name) { repositories in
            if let repos = repositories {
                self.repos.onNext(repos)
            }
        }
    }
}
