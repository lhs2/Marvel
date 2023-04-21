//
//  TitleViewModel.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import Foundation
import UIKit

struct TitleViewModel {
    let badgeImage: UIImage
    let titleLabel: NSAttributedString
    
    static var defaultTitle: TitleViewModel {
        let avengersFont = UIFont.get(fontName: "SFProDisplay-Semibold", weight: .semibold, size: 36, isItalic: false)
        let assembleFont = UIFont.get(fontName: "SFProDisplay-Bold", weight: .bold, size: 48, isItalic: false)

        let avengersTitle = NSMutableAttributedString(
            string: "Avengers,\n",
          attributes: [
            NSAttributedString.Key.font: avengersFont
          ]
        )
        
        let assembleTitle = NSMutableAttributedString(
            string: "Assemble!",
          attributes: [
            NSAttributedString.Key.font: assembleFont
          ]
        )
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(avengersTitle)
        mutableAttributedString.append(assembleTitle)
        
       return TitleViewModel(
        badgeImage: UIImage(imageLiteralResourceName: "marvelBadge"),
        titleLabel: mutableAttributedString)
    
    }
    
}
