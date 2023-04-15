//
//  AboutLayoutViewModel.swift
//  Marvel
//
//  Created by Luiz Henrique on 14/04/2023.
//

import Foundation

struct AboutLayoutViewModel {
    var aboutItems: [AboutCollectionViewCellModel]
    var carouselModel: [CarouselAboutCollectionViewCellModel]
    
    init(items: [AboutCollectionViewCellModel] = [], carouselModel: [CarouselAboutCollectionViewCellModel] = []) {
        self.aboutItems = items
        self.carouselModel = carouselModel
    }
    
    var numberOfAboutItems: Int {
        return aboutItems.count
    }
    
    var numberOfCarouselItems: Int {
        return carouselModel.count
    }
    
    func aboutItemForIndexPath(_ indexPath: IndexPath) -> AboutCollectionViewCellModel {
        return aboutItems[indexPath.row]
    }
    
    func carouselItemForIndexPath(_ indexPath: IndexPath) -> CarouselAboutCollectionViewCellModel {
        return carouselModel[indexPath.row]
    }
}
