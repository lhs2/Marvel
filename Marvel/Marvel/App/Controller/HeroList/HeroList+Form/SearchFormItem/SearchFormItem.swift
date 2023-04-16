//
//  SearchFormItem.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

final class SearchFormItem {

    var viewModel: SearchFormItemViewModel

    init(viewModel: SearchFormItemViewModel) {
        self.viewModel = viewModel
    }
}

extension SearchFormItem: FormItem {
    func register(for collectionView: UICollectionView) {
        collectionView.register(SearchFormItemCollectionViewCell.self, forCellWithReuseIdentifier: SearchFormItemCollectionViewCell.identifier)
    }
    
    func dequeue(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let titleFormCell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchFormItemCollectionViewCell.identifier, for: indexPath)
        guard let cell = titleFormCell as? SearchFormItemCollectionViewCell else {
            return titleFormCell
        }
        cell.configure(viewModel)
        return cell
    }
}
