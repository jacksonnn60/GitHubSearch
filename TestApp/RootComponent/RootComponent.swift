//
//  DependencyContainer.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import Foundation
import RxSwift
import NeedleFoundation

protocol IRootComponent {
    var disposeBag: DisposeBag { get }
    var searchRepoVM: RepositorySearchViewModel { get }
    var repositorySearchViewController: RepositorySearchViewController { get }
}

final class RootComponent: BootstrapComponent, IRootComponent {
    /* From documentation SwiftNeedle */

    var disposeBag: DisposeBag {
        return DisposeBag()
    }

    var searchRepoVM: RepositorySearchViewModel {
        return RepositorySearchViewModel()
    }

    var repositorySearchViewController: RepositorySearchViewController {
        return RepositorySearchViewController(nibName: Controllers.searchRepoVC, searchRepoVM: searchRepoVM, disposeBag: disposeBag)
    }
 }


