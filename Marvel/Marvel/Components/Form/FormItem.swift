//
//  FormItem.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

protocol FormItem: AnyObject {
    func register(for collectionView: UICollectionView)
    func dequeue(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell
    
    
}
