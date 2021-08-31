//
//  SceneDelegate.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let controller = RepositorySearchViewController(nibName: "RepositorySearchViewController", searchRepositoryViewModel: RepositorySearchViewModel())

        let navigationController = UINavigationController(rootViewController: controller)

        window.rootViewController = navigationController

        window.makeKeyAndVisible()
        self.window = window
    }

}

