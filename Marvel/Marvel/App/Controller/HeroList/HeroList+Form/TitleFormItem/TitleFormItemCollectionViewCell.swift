//
//  TitleFormItemCollectionViewCell.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

final class TitleFormItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleFormItemCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let badge: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    private func configureView() {
        addSubview(label)
        addSubview(badge)
        updateConstraint()
        layoutIfNeeded()
    }
    
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            badge.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            trailingAnchor.constraint(equalTo: badge.trailingAnchor),
            bottomAnchor.constraint(equalTo: label.bottomAnchor)
        ])
    
    }
}

extension TitleFormItemCollectionViewCell {
    func configure(_ viewModel: TitleFormItemViewModel) {
        label.attributedText = viewModel.titleLabel
        badge.image = viewModel.badgeImage
        configureView()
    }
}
