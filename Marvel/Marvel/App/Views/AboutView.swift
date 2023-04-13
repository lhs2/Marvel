//
//  AboutView.swift
//  Marvel
//
//  Created by Luiz Henrique on 12/04/2023.
//

import UIKit

final class AboutView : UIView {
    lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .black
        let textContent = "We can be heroes"
        let textString = NSMutableAttributedString(
          string: textContent,
          attributes: [
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Semibold", size: 27) ?? UIFont.boldSystemFont(ofSize: 27)
          ]
        )
        label.attributedText = textString
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        let textContent = "Charismatic, agile, strong, united, passionate and with a lot of wisdom, we are all Heroes in our own way."
        let textString = NSMutableAttributedString(
          string: textContent,
          attributes: [
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-MediumItalic", size: 18) ?? UIFont.italicSystemFont(ofSize: 18)
          ]
        )
        label.lineBreakMode = .byWordWrapping
        label.attributedText = textString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        let textContent = "Overview"
        let textString = NSMutableAttributedString(
          string: textContent,
          attributes: [
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Semibold", size: 27) ?? UIFont.boldSystemFont(ofSize: 27)
          ]
        )
        label.attributedText = textString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var overviewDescriptionLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        let textContent = "In fact, what makes us heroes are not supernatural forces, but the small gestures and attitudes that help to improve the daily lives of all of us and those around us. Heroes from December 8th to 11th at Parque das Nações – Lisbon."
        let textString = NSMutableAttributedString(
          string: textContent,
          attributes: [
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
          ]
        )
        label.attributedText = textString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var saleTitleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        let textContent = "Top selling items"
        let textString = NSMutableAttributedString(
          string: textContent,
          attributes: [
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Semibold", size: 27) ?? UIFont.boldSystemFont(ofSize: 27)
          ]
        )
        label.attributedText = textString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var saleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        let textContent = "market.epopculture.com"
        let textString = NSMutableAttributedString(
          string: textContent,
          attributes: [
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
          ]
        )
        label.attributedText = textString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    private func updateConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 8),
            
            overviewLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 36),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            trailingAnchor.constraint(equalTo: overviewLabel.trailingAnchor, constant: 8),
            
            overviewDescriptionLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 18),
            overviewDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            trailingAnchor.constraint(equalTo: overviewDescriptionLabel.trailingAnchor, constant: 8),
            
            saleTitleLabel.topAnchor.constraint(equalTo: overviewDescriptionLabel.bottomAnchor, constant: 36),
            saleTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            trailingAnchor.constraint(equalTo: saleTitleLabel.trailingAnchor, constant: 8),
            
            saleDescriptionLabel.topAnchor.constraint(equalTo: saleTitleLabel.bottomAnchor, constant: 8),
            saleDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            trailingAnchor.constraint(equalTo: saleDescriptionLabel.trailingAnchor, constant: 8),
            
            collectionView.topAnchor.constraint(equalTo: saleDescriptionLabel.bottomAnchor, constant: 18),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 12)
            
        ])
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(overviewLabel)
        scrollView.addSubview(overviewDescriptionLabel)
        scrollView.addSubview(saleTitleLabel)
        scrollView.addSubview(saleDescriptionLabel)
        scrollView.addSubview(collectionView)
        
    }
    
    init() {
        super.init(frame: CGRect.zero)
        addSubviews()
        updateConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
