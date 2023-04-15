//
//  UIFont+Extensions.swift
//  Marvel
//
//  Created by Luiz Henrique on 13/04/2023.
//

// "SFProDisplay-Semibold" -

import UIKit.UIFont

extension UIFont {
    
    class func get(fontName: String, weight: UIFont.Weight, size: CGFloat, isItalic: Bool) -> UIFont {
        if isItalic {
            return UIFont.italicSystemFont(ofSize: size, weight: weight)
        }
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    class func italicSystemFont(ofSize size: CGFloat, weight: UIFont.Weight = .regular)-> UIFont {
        let font = UIFont.systemFont(ofSize: size, weight: weight)
        switch weight {
        case .ultraLight, .light, .thin, .regular:
            return font.withTraits(.traitItalic, ofSize: size)
        case .medium, .semibold, .bold, .heavy, .black:
            return font.withTraits(.traitBold, .traitItalic, ofSize: size)
        default:
            return UIFont.italicSystemFont(ofSize: size)
        }
     }
    
     func withTraits(_ traits: UIFontDescriptor.SymbolicTraits..., ofSize size: CGFloat) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: size)
     }
      
}
