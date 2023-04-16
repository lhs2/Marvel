//
//  HeroFormItem.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

final class HeroFormItem {

    var viewModel: HeroFormItemViewModel

    init(viewModel: HeroFormItemViewModel) {
        self.viewModel = viewModel
    }
}

extension HeroFormItem: FormItem {
    func register(for collectionView: UICollectionView) {
        collectionView.register(HeroFormItemCollectionViewCell.self, forCellWithReuseIdentifier: HeroFormItemCollectionViewCell.identifier)
    }
    
    func dequeue(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let titleFormCell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroFormItemCollectionViewCell.identifier, for: indexPath)
        guard let cell = titleFormCell as? HeroFormItemCollectionViewCell else {
            return titleFormCell
        }
        cell.configure(viewModel)
        return cell
    }
}
