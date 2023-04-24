//
//  HorizontalCellCollectionHeroDetailViewController.swift
//  Marvel
//
//  Created by Luiz Henrique on 24/04/2023.
//

import Foundation

import UIKit
import Kingfisher

final class HorizontalCellCollectionHeroDetailViewController: UICollectionViewCell {
    static let identifier = "CarouselItemAboutCollectionViewCell"
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true

        return imageView
    }()

    
    private let label: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .fontGray
        label.font = UIFont.get(fontName: "SFProDisplay-Regular", weight: .regular, size: 16, isItalic: false)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    var model: MarvelComic? {
        didSet {
            if let model = model {
                label.text = model.title
                if let thumbnail = model.thumbnail,
                   let url = thumbnail.url,
                   !thumbnail.fullPath.contains("image_not_available") {
                    imageView.kf.setImage(with: url)
                } else {
                    imageView.image = UIImage(imageLiteralResourceName: "missing_comic")
                }
                configureView()
            }
            
        }
    }
    
    
    private func configureView() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        updateConstraint()
        layoutIfNeeded()
    }
    
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 225),
            imageView.widthAnchor.constraint(equalToConstant: 150),
                        
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 150),
            
        ])
    }
}
