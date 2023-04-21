//
//  AboutService.swift
//  Marvel
//
//  Created by Luiz Henrique on 13/04/2023.
//

import UIKit.UIColor


protocol AboutServiceLogic {
    func getAboutLayoutItems(completion: @escaping (AboutLayoutViewModel?) -> Void)
}

final class AboutService: AboutServiceLogic {
    func getAboutLayoutItems(completion: @escaping (AboutLayoutViewModel?) -> Void) {
        let aboutLabelItems = getAboutLabelItems()
        let carouselItems = getCarouselItems()
        completion(AboutLayoutViewModel(items: aboutLabelItems, carouselModel: carouselItems))
    }
    
    private func getAboutLabelItems() -> [AboutCollectionViewCellModel] {
        var aboutLabelItems = [AboutCollectionViewCellModel]()
        var titleLabel = AboutCollectionViewCellModel(type:. label,
                                                      text: "We can be heroes",
                                                      fontName: "SFProDisplay-Semibold",
                                                      weight: .semibold,
                                                      size: 27,
                                                      color: .black)
        titleLabel.constraint = (top: 24, trailing: 0, bottom: 0, leading: 0)
        aboutLabelItems.append(titleLabel)
        
        var descriptionLabel = AboutCollectionViewCellModel(type:. label,
                                                            text:"Charismatic, agile, strong, united, passionate and with a lot of wisdom, we are all Heroes in our own way.",
                                                            fontName: "SFProDisplay-MediumItalic",
                                                            weight: .medium,
                                                            size: 18,
                                                            color: .fontGray,
                                                            isItalic: true)
        descriptionLabel.constraint = (top: 31, trailing: 0, bottom: 0, leading: 0)
        aboutLabelItems.append(descriptionLabel)
        
        var overviewLabel = AboutCollectionViewCellModel(type:. label,
                                                         text: "Overview",
                                                         fontName: "SFProDisplay-Semibold",
                                                         weight: .semibold,
                                                         size: 27,
                                                         color: .black)
        overviewLabel.constraint = (top: 36, trailing: 0, bottom: 0, leading: 0)
        aboutLabelItems.append(overviewLabel)
        
        var overviewDescriptionLabel = AboutCollectionViewCellModel(type:. label,
                                                                    text: "In fact, what makes us heroes are not supernatural forces, but the small gestures and attitudes that help to improve the daily lives of all of us and those around us. Heroes from December 8th to 11th at Parque das Nações – Lisbon.",
                                                                    fontName: "SFProDisplay-Regular",
                                                                    weight: .regular,
                                                                    size: 16,
                                                                    color: .fontGray)
        overviewDescriptionLabel.constraint = (top: 18, trailing: 0, bottom: 0, leading: 0)
        aboutLabelItems.append(overviewDescriptionLabel)
        
        var saleTitleLabel = AboutCollectionViewCellModel(type:. label,
                                                          text: "Top selling items",
                                                          fontName: "SFProDisplay-Semibold",
                                                          weight: .semibold,
                                                          size: 27,
                                                          color: .fontGray)
        saleTitleLabel.constraint = (top: 36, trailing: 0, bottom: 0, leading: 0)
        aboutLabelItems.append(saleTitleLabel)
        
        var saleDescriptionLabel = AboutCollectionViewCellModel(type:. label,
                                                                text: "market.epopculture.com",
                                                                fontName: "SFProDisplay-Regular",
                                                                weight: .regular,
                                                                size: 16,
                                                                color: .fontGray)
        saleDescriptionLabel.constraint = (top: 8, trailing: 0, bottom: 0, leading: 0)
        aboutLabelItems.append(saleDescriptionLabel)
        
        return aboutLabelItems
    }
    
    func getCarouselItems() -> [CarouselAboutCollectionViewCellModel] {
        
        let firstMockItem = CarouselItemAboutCollectionViewCellModel(text: "Comic-Con PT Hoodie",
                                                                     image: UIImage(named: "cc-hoodie"))
        let secondtMockItem = CarouselItemAboutCollectionViewCellModel(text: "Star Wa... Trek Hoodie",
                                                                       image: UIImage(named: "startrek-hoodie"))
        let thirdMockItem = CarouselItemAboutCollectionViewCellModel(text: "Slipknot Hoodie",
                                                                     image: UIImage(named: "slipknot-hoodie"))
        
        let firstList = CarouselAboutCollectionViewCellModel(type: .collection, items: [firstMockItem,secondtMockItem,thirdMockItem])
        
        return [firstList]
    }
}
