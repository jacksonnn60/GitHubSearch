//
//  DependencyContainer.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import Foundation
import RxSwift
import NeedleFoundation

 class RootComponent: BootstrapComponent {

    /* From documentation SwiftNeedle */

    var disposeBag: DisposeBag {
        return DisposeBag()
    }

    var searchRepositoryViewModel: RepositorySearchViewModel {
        return RepositorySearchViewModel()
    }

    var repositorySearchViewController: RepositorySearchViewController {
        return RepositorySearchViewController(nibName: Controllers.searchRepositoryController, searchRepositoryViewModel: searchRepositoryViewModel, disposeBag: disposeBag)
    }
 }

