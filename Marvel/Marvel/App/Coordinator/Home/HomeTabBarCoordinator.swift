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
        var viewControllers = [UIViewController]()
        
        let heroListCoordinator = HeroListCoordinator()
        heroListCoordinator.start()
        
        if let heroListViewController = heroListCoordinator.viewController {
            viewControllers.append(heroListViewController)
        }
        
        let aboutCoordinator = AboutCoordinator()
        aboutCoordinator.start()
        
        if let aboutViewController = aboutCoordinator.viewController {
            viewControllers.append(aboutViewController)
        }
        
        tabBarController.setViewControllers(viewControllers, animated: false)
        tabBarController.selectedIndex = 0

        let navigationController = UINavigationController.init(rootViewController: tabBarController)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        window.rootViewController = navigationController
    }
}
