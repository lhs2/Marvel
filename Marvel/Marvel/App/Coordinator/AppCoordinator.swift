//
//  AppCoordinator.swift
//  Marvel
//
//  Created by Luiz Henrique on 12/04/2023.
//

import UIKit

final class AppCoordinator: Coordinator {

    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showHome()
    }

    func showHome() {
        let tabBarCoordinator = HomeTabBarCoordinator(window: window)
        tabBarCoordinator.start()
    }

}
