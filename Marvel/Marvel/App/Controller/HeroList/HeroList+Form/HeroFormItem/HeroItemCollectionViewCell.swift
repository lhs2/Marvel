//
//  HeroItemCollectionViewCell.swift
//  Marvel
//
//  Created by Luiz Henrique on 16/04/2023.
//

import UIKit
import Kingfisher

final class HeroItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "HeroItemCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 9
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    private let labelBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 9
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.backgroundColor = UIColor(red: 0.39, green: 0.08, blue: 0.66, alpha: 0.9)
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.clipsToBounds = true
        label.textColor = .white
        label.font = UIFont.get(fontName: "SFProDisplay-Semibold", weight: .semibold, size: 18, isItalic: false)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private var viewModel: HeroItemViewModel?
    
    private func configureView() {
        addSubview(imageView)
        addSubview(labelBackgroundView)
        labelBackgroundView.addSubview(label)
        updateConstraint()
        layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelBackgroundView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: labelBackgroundView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: labelBackgroundView.bottomAnchor),
            labelBackgroundView.heightAnchor.constraint(equalToConstant: 60),
            label.topAnchor.constraint(equalTo: labelBackgroundView.topAnchor),
            label.leadingAnchor.constraint(equalTo: labelBackgroundView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: labelBackgroundView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: labelBackgroundView.bottomAnchor)
        ])
    }
    
    func addImageViewConstraints(_ height: CGFloat, _ width: CGFloat) {
        let imageViewHeightConstraint = NSLayoutConstraint.init(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: height)
        imageViewHeightConstraint.priority = UILayoutPriority(999.0)
        imageViewHeightConstraint.isActive = true
        
        let imageViewWidthConstraint = NSLayoutConstraint.init(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: width)
        imageViewWidthConstraint.priority = UILayoutPriority(999.0)
        imageViewWidthConstraint.isActive = true
    }
}

extension HeroItemCollectionViewCell {
    
    func configure(_ viewModel: HeroItemViewModel, collectionWidth: CGFloat) {
        let placeholder = #imageLiteral(resourceName: "marvelBadge")
        let safeArea = collectionWidth - 32
        imageView.kf.setImage(with: viewModel.imagePath, placeholder: placeholder) { [weak self] result in
            switch result {
            case .success(let imageResponse):
                var imageWidth = imageResponse.image.size.width
                var imageHeight = imageResponse.image.size.height
                guard let self = self else { return }
                if  imageWidth > collectionWidth {
                    let ratio = safeArea / imageWidth
                    imageWidth = imageWidth * ratio
                    imageHeight = imageHeight * ratio
                    self.addImageViewConstraints(imageHeight, imageWidth)
                }
                self.layoutIfNeeded()
            case .failure(_):
                print("Error download image")
            }
        }
        label.text = viewModel.heroName
        self.viewModel = viewModel
        configureView()
    }
    
    func getCurrentViewModel() -> HeroItemViewModel? {
        return viewModel
    }

}

