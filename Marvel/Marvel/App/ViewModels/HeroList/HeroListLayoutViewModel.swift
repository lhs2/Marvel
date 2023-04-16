//
//  HeroListLayoutViewModel.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import Foundation
import UIKit

struct HeroListLayoutViewModel {
    
    var formItems: [FormItem]

    init(formItems: [FormItem] = []) {
        self.formItems = formItems
    }
    
    var numberOfItems: Int {
        return formItems.count
    }
    
    func registerCell(in collectionView: UICollectionView?) {
        guard let collectionView = collectionView else {
            return
        }
        
        formItems.forEach() { formItem in
            formItem.register(for: collectionView)
        }
    }
    
    func getFormItemFor(indexPath: IndexPath) -> FormItem {
        return formItems[indexPath.row]
    }
    
}
