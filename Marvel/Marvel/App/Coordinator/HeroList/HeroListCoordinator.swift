//
//  HeroListCoordinator.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

final class HeroListCoordinator : DefaultCoordinator {
    var viewController: (UIViewController & Coordinated)?

    init(viewController: (UIViewController & Coordinated) = HeroListViewController()) {
        self.viewController = viewController
    }

    func start() {
        viewController?.setCoordinator(self)
    }
}
