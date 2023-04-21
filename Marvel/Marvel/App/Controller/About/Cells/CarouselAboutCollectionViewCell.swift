//
//  CarouselAboutCollectionViewCell.swift
//  Marvel
//
//  Created by Luiz Henrique on 14/04/2023.
//

import UIKit

struct CarouselAboutCollectionViewCellModel {
    var type: AboutCollectionViewCellModelType = .collection
    var items = [CarouselItemAboutCollectionViewCellModel]()
}

final class CarouselAboutCollectionViewCell: UICollectionViewCell {
    static let identifier = "CarouselAboutCollectionViewCell"
    
    private var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.estimatedItemSize = .zero
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(
            CarouselItemAboutCollectionViewCell.self,
            forCellWithReuseIdentifier: CarouselItemAboutCollectionViewCell.identifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    

    var model: CarouselAboutCollectionViewCellModel? {
        didSet {
            collectionView.reloadData()
            configureView()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let frame = contentView.bounds
        collectionView.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: 280)
    }
    
    
    private func configureView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        sendSubviewToBack(contentView)
        updateConstraint()
        layoutIfNeeded()
    }
    
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 280),
            trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
        ])
    }
}

extension CarouselAboutCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let labelCell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselItemAboutCollectionViewCell.identifier, for: indexPath)
        guard let cell = labelCell as? CarouselItemAboutCollectionViewCell,
              let itemList  = model?.items else {
            return labelCell
        }
        cell.model = itemList[indexPath.row]
        return cell
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 155, height: 270)
    }
}
