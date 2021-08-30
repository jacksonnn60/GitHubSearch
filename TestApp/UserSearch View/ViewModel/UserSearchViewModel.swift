//
//  UserSearchViewModel.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import Foundation
import RxCocoa
import RxSwift

private protocol UserSearchViewModelProtocol {
    var repositories: BehaviorSubject<[Repository]> { get set }

    func searhUsers(with name: String)
}

class UserSearchViewModel: UserSearchViewModelProtocol {
    var repositories = BehaviorSubject<[Repository]>.init(value: [])

    func searhUsers(with name: String) {
        Rest.get(urlString: "https://api.github.com/users/\(name)/repos", generalType: [Repository].self) { result in
            do {
                let repositories = try result.get()
                self.repositories.onNext(repositories)
            } catch {
                print("Can not get repositories.")
            }
        }
    }
}