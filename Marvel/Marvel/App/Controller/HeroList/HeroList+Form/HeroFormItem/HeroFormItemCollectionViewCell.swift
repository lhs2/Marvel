//
//  HeroFormItemCollectionViewCell.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

final class HeroFormItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "HeroFormItemCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 9
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.clipsToBounds = true
        label.textColor = .white
        label.layer.cornerRadius = 9
        label.font = UIFont.get(fontName: "SFProDisplay-Semibold", weight: .semibold, size: 18, isItalic: false)
        label.layer.backgroundColor = UIColor(red: 0.39, green: 0.08, blue: 0.66, alpha: 0.5).cgColor
        label.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private func configureView() {
        addSubview(imageView)
        addSubview(label)
        updateConstraint()
        layoutIfNeeded()
    }
    
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            bottomAnchor.constraint(equalTo: label.bottomAnchor)
        ])
    }
}

extension HeroFormItemCollectionViewCell {
    func configure(_ viewModel: HeroFormItemViewModel) {
        imageView.image = viewModel.image
        label.text = viewModel.charName
    }
}

