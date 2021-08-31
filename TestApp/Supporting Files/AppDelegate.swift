//
//  AppDelegate.swift
//  TestApp
//
//  Created by Jackson  on 30.08.2021.
//

import UIKit
import NeedleFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerProviderFactories()
        return true
    }

}

