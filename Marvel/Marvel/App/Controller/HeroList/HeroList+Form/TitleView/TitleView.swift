//
//  TitleView.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

final class TitleView: UIView {
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
        backgroundColor = .white
        addSubview(label)
        addSubview(badge)
        updateConstraint()
        layoutIfNeeded()
    }
    
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            
            badge.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            trailingAnchor.constraint(equalTo: badge.trailingAnchor, constant: 18),
            bottomAnchor.constraint(equalTo: label.bottomAnchor)
        ])
    
    }
}

extension TitleView {
    func configure(_ viewModel: TitleViewModel = TitleViewModel.defaultTitle ) {
        label.attributedText = viewModel.titleLabel
        badge.image = viewModel.badgeImage
        configureView()
    }
}
