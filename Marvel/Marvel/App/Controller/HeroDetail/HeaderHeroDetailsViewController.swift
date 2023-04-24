//
//  HeaderHeroDetailsViewController.swift
//  Marvel
//
//  Created by Luiz Henrique on 24/04/2023.
//

import UIKit
class HeaderHeroDetailsViewController: UICollectionReusableView {
    
    static let identifier = "HeaderHeroDetailsViewController"
    private var viewModel: HeroItemViewModel?
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 9
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
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

    private let nameLabel: UILabel = {
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

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.clipsToBounds = true
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        label.font = UIFont.get(fontName: "SFProDisplay-MediumItalic", weight: .medium, size: 18, isItalic: true)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()

    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.clipsToBounds = true
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        label.font = UIFont.get(fontName: "SFProDisplay-MediumItalic", weight: .medium, size: 18, isItalic: true)
        label.text = "Overview"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()

    private let overviewInfoLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.clipsToBounds = true
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        label.font = UIFont.get(fontName: "SFProDisplay-MediumItalic", weight: .medium, size: 18, isItalic: true)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configure(with viewModel: HeroItemViewModel) {
        imageView.kf.setImage(with: viewModel.imagePath)
        nameLabel.text = viewModel.heroName
        descriptionLabel.text = viewModel.marvelCharacter.description ?? "No information for description section was provvided"
        overviewInfoLabel.text = "No information for overview section was provided"
        configureView()
    }
    
    private func configureView() {
        addSubview(imageView)
        addSubview(labelBackgroundView)
        labelBackgroundView.addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(overviewLabel)
        addSubview(overviewInfoLabel)
        updateConstraint()
        layoutIfNeeded()
    }
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 350),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            labelBackgroundView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: labelBackgroundView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: labelBackgroundView.bottomAnchor),
            labelBackgroundView.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.topAnchor.constraint(equalTo: labelBackgroundView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: labelBackgroundView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: labelBackgroundView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: labelBackgroundView.bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: labelBackgroundView.bottomAnchor, constant: 18),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 18),
            
            overviewLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 36),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            trailingAnchor.constraint(equalTo: overviewLabel.trailingAnchor, constant: 18),
            
            overviewInfoLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 18),
            overviewInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: overviewInfoLabel.trailingAnchor, constant: 18),
            bottomAnchor.constraint(equalTo: overviewInfoLabel.bottomAnchor)
            
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
