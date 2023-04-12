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
        tabBarController.setViewControllers([], animated: false)

        window.rootViewController = tabBarController
    }
}
