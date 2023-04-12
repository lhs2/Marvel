//
//  AppDelegate.swift
//  Marvel
//
//  Created by Luiz Henrique on 11/04/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = AppCoordinator(window: window)
        coordinator?.start()
        window?.makeKeyAndVisible()
        //window?.rootViewController = HomeTabBarController()
        return true
    }

}

