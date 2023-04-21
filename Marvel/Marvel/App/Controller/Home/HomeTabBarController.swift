//
//  HomeTabBarController.swift
//  Marvel
//
//  Created by Luiz Henrique on 12/04/2023.
//

import UIKit

final class HomeTabBarController: UITabBarController {
    var viewModel: HomeViewModel? {
        didSet {
            setupUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupUI() {
        if !isViewLoaded {
            return
        }
        
        guard let _ = viewModel else {
            return
        }

    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
