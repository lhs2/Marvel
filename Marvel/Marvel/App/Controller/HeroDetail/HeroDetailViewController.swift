//
//  HeroDetailViewController.swift
//  Marvel
//
//  Created by Luiz Henrique on 21/04/2023.
//

import UIKit

protocol HeroDetailViewControllerProtocol {
    var viewModel: HeroItemViewModel? { get set }
}

final class HeroDetailViewController: UICollectionViewController, HeroDetailViewControllerProtocol {
    var viewModel: HeroItemViewModel?
    var coordinator: HeroDetailCoordinator?
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "default")
        collectionView.register(HeaderHeroDetailsViewController.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderHeroDetailsViewController.identifier)
    }
        
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderHeroDetailsViewController.identifier, for: indexPath)
        guard let headerCell = header as? HeaderHeroDetailsViewController,
              let viewModel = viewModel else {
            return header
        }
        headerCell.configure(with: viewModel)
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let indexPath = IndexPath(row: 0, section: section)
        let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)

        return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width,
                                                         height: UIView.layoutFittingExpandedSize.height),
                                                         withHorizontalFittingPriority: .required,
                                                         verticalFittingPriority: .fittingSizeLevel)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath)

    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
}


extension HeroDetailViewController: Coordinated {
    
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as?  HeroDetailCoordinator
    }
}

extension HeroDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}
