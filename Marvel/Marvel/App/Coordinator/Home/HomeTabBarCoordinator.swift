//
//  HomeTabBarCoordinator.swift
//  Marvel
//
//  Created by Luiz Henrique on 12/04/2023.
//

import UIKit

class HomeTabBarCoordinator: Coordinator {

    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let tabBarController = HomeTabBarController()
        
        let aboutViewController = AboutCoordinator()
        aboutViewController.start()
        
        if let aboutVC = aboutViewController.viewController {
            tabBarController.setViewControllers([aboutVC], animated: false)
        }

        let navigationController = UINavigationController.init(rootViewController: tabBarController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        window.rootViewController = navigationController
    }
}
