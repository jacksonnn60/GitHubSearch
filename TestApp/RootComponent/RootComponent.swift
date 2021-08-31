//
//  DependencyContainer.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import Foundation
import NeedleFoundation

 class RootComponent: BootstrapComponent {

    /* From documentation SwiftNeedle */
    var repositorySearchViewController: RepositorySearchViewController {
        return RepositorySearchViewController(nibName: "RepositorySearchViewController", searchRepositoryViewModel: RepositorySearchViewModel())
    }

 }


