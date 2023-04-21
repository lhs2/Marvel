//
//  AboutViewController.swift
//  Marvel
//
//  Created by Luiz Henrique on 12/04/2023.
//

import UIKit

final class AboutViewController: UIViewController {
    private var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    var coordinator: AboutCoordinator?
    let viewModel: AboutViewModelProtocol
    var layoutViewModel = AboutLayoutViewModel()
    
    init(viewModel: AboutViewModelProtocol = AboutViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.image = UIImage(imageLiteralResourceName: "tab_about")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        
        setupCollectionView()
        updateConstraint()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
    }
    
        
    private func setupCollectionView() {
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        config.showsSeparators = false
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LabelAboutCollectionViewCell.self, forCellWithReuseIdentifier: LabelAboutCollectionViewCell.identifier)
        collectionView.register(CarouselAboutCollectionViewCell.self, forCellWithReuseIdentifier: CarouselAboutCollectionViewCell.identifier)
        view.addSubview(collectionView)
    }
    
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestItens()
    }
    
}

extension AboutViewController: Coordinated {
    
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? AboutCoordinator
    }
}

extension AboutViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return layoutViewModel.numberOfAboutItems
        }
        return layoutViewModel.numberOfCarouselItems
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let item = layoutViewModel.aboutItemForIndexPath(indexPath)
            let labelCell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelAboutCollectionViewCell.identifier, for: indexPath)
            guard let cell = labelCell as? LabelAboutCollectionViewCell else {
                return labelCell
            }
            cell.model = item
            return cell
        }
        
        let item = layoutViewModel.carouselItemForIndexPath(indexPath)
        let labelCell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselAboutCollectionViewCell.identifier, for: indexPath)
        guard let cell = labelCell as? CarouselAboutCollectionViewCell else {
            return labelCell
        }
        cell.model = item
        return cell
        
    }
}

/// Request about itens
extension AboutViewController {
    func requestItens() {
        let completionBlock: AboutViewModel.GetAboutItemsCompletionBlock = { [weak self] result in
            switch result {
            case .success(let layoutViewModel):
                self?.layoutViewModel = layoutViewModel
                self?.collectionView.reloadData()
            case .failure(_):
                /// TODO: Show error when not being able to load about information
                fatalError("Not implemented error case")
            }
        }
        
        viewModel.fetchItems(completion: completionBlock)
    }
}


