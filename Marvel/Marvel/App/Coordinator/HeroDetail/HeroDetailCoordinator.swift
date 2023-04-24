//
//  HeroDetailCoordinator.swift
//  Marvel
//
//  Created by Luiz Henrique on 21/04/2023.
//

import Foundation

import UIKit

final class HeroDetailCoordinator : DefaultCoordinator {
    var viewModel: HeroItemViewModel
    var viewController: (UIViewController & Coordinated)?

    init(viewModel: HeroItemViewModel, viewController: (UIViewController & Coordinated) = HeroDetailViewController()) {
        self.viewModel = viewModel
        self.viewController = viewController
    }

    func start() {
        viewController?.setCoordinator(self)
        if var viewController = viewController as? HeroDetailViewControllerProtocol {
            viewController.viewModel = self.viewModel
        }
    }
}
