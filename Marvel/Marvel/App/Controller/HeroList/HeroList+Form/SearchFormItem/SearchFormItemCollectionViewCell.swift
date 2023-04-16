//
//  SearchFormItemCollectionViewCell.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

final class SearchFormItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchFormItemCollectionViewCell"
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private func configureView() {
        addSubview(searchBar)
        updateConstraint()
        layoutIfNeeded()
    }
    
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 4),
            trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 4),
            bottomAnchor.constraint(equalTo: searchBar.bottomAnchor)
        ])
    
    }
}

extension SearchFormItemCollectionViewCell {
    func configure(_ viewModel: SearchFormItemViewModel) {
        configureView()
    }
}

