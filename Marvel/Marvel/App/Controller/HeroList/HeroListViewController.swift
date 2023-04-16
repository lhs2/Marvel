//
//  HeroListViewController.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

final class HeroListViewController: UIViewController {
    private var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    var coordinator: HeroListCoordinator?
    let viewModel: HeroListViewModelProtocol
    var layoutViewModel = HeroListLayoutViewModel()
    
    init(viewModel: HeroListViewModelProtocol = HeroListViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = "Hero List"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
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
        collectionView.register(TitleFormItemCollectionViewCell.self, forCellWithReuseIdentifier: TitleFormItemCollectionViewCell.identifier)
        collectionView.register(SearchFormItemCollectionViewCell.self, forCellWithReuseIdentifier: SearchFormItemCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.layer.backgroundColor = UIColor.white.cgColor
        collectionView.delegate = self
        collectionView.dataSource = self
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

extension HeroListViewController: Coordinated {
    
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? HeroListCoordinator
    }
}

extension HeroListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return layoutViewModel.numberOfItems
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let field = layoutViewModel.getFormItemFor(indexPath: indexPath)
        return field.dequeue(for: collectionView, at: indexPath)

    }
}

/// Request about itens
extension HeroListViewController {
    func requestItens() {
        let completionBlock: HeroListViewModel.GetHeroListCompletionBlock = { [weak self] result in
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


