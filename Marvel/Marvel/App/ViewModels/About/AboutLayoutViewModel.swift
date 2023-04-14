//
//  AboutLayoutViewModel.swift
//  Marvel
//
//  Created by Luiz Henrique on 14/04/2023.
//

import Foundation

struct AboutLayoutViewModel {
    var items: [AboutCollectionViewCellModel]
    
    init(items: [AboutCollectionViewCellModel] = []) {
        self.items = items
    }
    
    var numberOfItems: Int {
        return items.count
    }
    
    func itemForIndexPath(_ indexPath: IndexPath) -> AboutCollectionViewCellModel {
        return items[indexPath.row]
    }
}
