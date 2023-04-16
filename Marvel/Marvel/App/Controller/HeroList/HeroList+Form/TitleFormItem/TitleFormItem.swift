//
//  TitleFormItem.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

final class TitleFormItem {

    var viewModel: TitleFormItemViewModel

    init(viewModel: TitleFormItemViewModel) {
        self.viewModel = viewModel
    }
}

extension TitleFormItem: FormItem {
    func register(for collectionView: UICollectionView) {
        collectionView.register(TitleFormItemCollectionViewCell.self, forCellWithReuseIdentifier: TitleFormItemCollectionViewCell.identifier)
    }
    
    func dequeue(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let titleFormCell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleFormItemCollectionViewCell.identifier, for: indexPath)
        guard let cell = titleFormCell as? TitleFormItemCollectionViewCell else {
            return titleFormCell
        }
        cell.configure(viewModel)
        return cell
    }
}
