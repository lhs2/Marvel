//
//  AboutService.swift
//  Marvel
//
//  Created by Luiz Henrique on 13/04/2023.
//

//import Foundation
import UIKit.UIColor

protocol AboutServiceLogic {
    func getAboutItems(completion: @escaping ([AboutCollectionViewCellModel]?) -> Void)
}

final class AboutService: AboutServiceLogic {
    func getAboutItems(completion: @escaping ([AboutCollectionViewCellModel]?) -> Void) {
        var items = [AboutCollectionViewCellModel]()
        
        let grayColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        
        let titleLabel = AboutCollectionViewCellModel(type:. label,
                                                           text: "We can be heroes",
                                                           fontName: "SFProDisplay-Semibold",
                                                           weight: .semibold,
                                                           size: 27,
                                                           color: .black)
        items.append(titleLabel)
        
        let descriptionLabel = AboutCollectionViewCellModel(type:. label,
                                                                 text:"Charismatic, agile, strong, united, passionate and with a lot of wisdom, we are all Heroes in our own way.",
                                                                 fontName: "SFProDisplay-MediumItalic",
                                                                 weight: .medium,
                                                                 size: 18,
                                                                 color: grayColor,
                                                                 isItalic: true)
        items.append(descriptionLabel)
        
        let overviewLabel = AboutCollectionViewCellModel(type:. label,
                                                              text: "Overview",
                                                              fontName: "SFProDisplay-Semibold",
                                                              weight: .semibold,
                                                              size: 27,
                                                              color: .black)
        items.append(overviewLabel)
        
        let overviewDescriptionLabel = AboutCollectionViewCellModel(type:. label,
                                                                         text: "In fact, what makes us heroes are not supernatural forces, but the small gestures and attitudes that help to improve the daily lives of all of us and those around us. Heroes from December 8th to 11th at Parque das Nações – Lisbon.",
                                                                         fontName: "SFProDisplay-Regular",
                                                                         weight: .regular,
                                                                         size: 16,
                                                                         color: grayColor)
        items.append(overviewDescriptionLabel)
        
        let saleTitleLabel = AboutCollectionViewCellModel(type:. label,
                                                               text: "Top selling items",
                                                               fontName: "SFProDisplay-Semibold",
                                                               weight: .semibold,
                                                               size: 27,
                                                               color: grayColor)
        items.append(saleTitleLabel)
        
        let saleDescriptionLabel = AboutCollectionViewCellModel(type:. label,
                                                                     text: "market.epopculture.com",
                                                                     fontName: "SFProDisplay-Regular",
                                                                     weight: .regular,
                                                                     size: 16,
                                                                     color: grayColor)
        items.append(saleDescriptionLabel)
        
        completion(items)
        
    }
}
