//
//  AboutCoordinator.swift
//  Marvel
//
//  Created by Luiz Henrique on 12/04/2023.
//

import UIKit

class AboutCoordinator: DefaultCoordinator {
    var viewController: (UIViewController & Coordinated)?

    init() {
        self.viewController = AboutViewController()
    }

    func start() {
        viewController?.setCoordinator(self)
    }
}
