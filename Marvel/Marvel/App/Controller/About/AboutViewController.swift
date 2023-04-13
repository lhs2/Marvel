//
//  AboutViewController.swift
//  Marvel
//
//  Created by Luiz Henrique on 12/04/2023.
//

import UIKit

final class AboutViewController: UIViewController, Coordinated {
    var coordinator: AboutCoordinator?
    
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? AboutCoordinator
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "About this app"
        navigationItem.setValue(true, forKey: "__largeTitleTwoLineMode")
    }
    
}
