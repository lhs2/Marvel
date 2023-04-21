//
//  HeroDetailViewController.swift
//  Marvel
//
//  Created by Luiz Henrique on 21/04/2023.
//

import UIKit

protocol HeeroDetailViewControllerProtocol {
    var viewModel: HeroItemViewModel? { get set }
}

final class HeroDetailViewController: UIViewController, HeeroDetailViewControllerProtocol {
    var viewModel: HeroItemViewModel?
    var coordinator: HeroDetailCoordinator?
}


extension HeroDetailViewController: Coordinated {
    
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as?  HeroDetailCoordinator
    }
}
