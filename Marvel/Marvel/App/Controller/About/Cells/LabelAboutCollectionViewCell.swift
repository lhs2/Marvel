//
//  LabelAboutCollectionViewCell.swift
//  Marvel
//
//  Created by Luiz Henrique on 13/04/2023.
//

import UIKit

enum AboutCollectionViewCellModelType {
    case label, collection
}

struct AboutCollectionViewCellModel {
    typealias MarginConstraint = (top: CGFloat, trailing: CGFloat, bottom: CGFloat, leading: CGFloat)
    var type: AboutCollectionViewCellModelType = .label
    let text: String
    let fontName: String
    let weight: UIFont.Weight
    let size: CGFloat
    let color: UIColor
    var image: UIImage? = nil
    var isItalic: Bool = false
    
    var constraint: MarginConstraint = (top: 0, trailing: 0, bottom: 0, leading: 0)
    
}

final class LabelAboutCollectionViewCell: UICollectionViewCell {
    static let identifier = "LabelAboutCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    var model: AboutCollectionViewCellModel? {
        didSet {
            if let model = model {
                label.textColor = model.color
                let font = UIFont.get(fontName: model.fontName, weight: model.weight, size: model.size, isItalic: model.isItalic)
                let textString = NSMutableAttributedString(
                    string: model.text,
                  attributes: [
                    NSAttributedString.Key.font: font
                  ]
                )
                label.attributedText = textString
                configureView()
            }
            
        }
    }
    
    
    private func configureView() {
        addSubview(label)
        updateConstraint()
        layoutIfNeeded()
    }
    
    
    private func updateConstraint() {
        if let model = model {
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: topAnchor, constant: model.constraint.top),
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: model.constraint.leading),
                trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: model.constraint.trailing),
                bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: model.constraint.bottom),
            ])
        }
    }
}
