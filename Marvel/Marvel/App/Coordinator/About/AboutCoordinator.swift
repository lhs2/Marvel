//
//  AboutCoordinator.swift
//  Marvel
//
//  Created by Luiz Henrique on 12/04/2023.
//

import UIKit

class AboutCoordinator: DefaultCoordinator {
    var viewController: (UIViewController & Coordinated)?

    init(viewController: (UIViewController & Coordinated) = AboutViewController()) {
        self.viewController = viewController
    }

    func start() {
        viewController?.setCoordinator(self)
    }
}
