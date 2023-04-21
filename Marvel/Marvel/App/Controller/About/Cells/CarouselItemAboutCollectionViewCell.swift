//
//  CarouselItemAboutCollectionViewCell.swift
//  Marvel
//
//  Created by Luiz Henrique on 14/04/2023.
//

import UIKit

struct CarouselItemAboutCollectionViewCellModel {
    let text: String
    let image: UIImage?
}

final class CarouselItemAboutCollectionViewCell: UICollectionViewCell {
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
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    var model: CarouselItemAboutCollectionViewCellModel? {
        didSet {
            if let model = model {
                label.textColor = .fontGray
                let font = UIFont.get(fontName: "SFProDisplay-Regular", weight: .regular, size: 16, isItalic: false)
                let textString = NSMutableAttributedString(
                    string: model.text,
                  attributes: [
                    NSAttributedString.Key.font: font
                  ]
                )
                label.attributedText = textString
                imageView.image = model.image ?? #imageLiteral(resourceName: "iTunesArtwork")
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
            imageView.heightAnchor.constraint(equalToConstant: 210),
            imageView.widthAnchor.constraint(equalToConstant: 150),
                        
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 2),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 150),
            
        ])
    }
}
