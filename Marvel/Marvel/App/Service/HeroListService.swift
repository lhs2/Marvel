//
//  HeroListService.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

protocol HeroListServiceLogic {
    func getHeroList(completion: @escaping ([FormItem]?) -> Void)
}

final class HeroListService: HeroListServiceLogic {
    func getHeroList(completion: @escaping ([FormItem]?) -> Void) {
        var list = [FormItem]()
        list.append(createTitleFormItem())
        list.append(createSearchFormItem())
        completion(list)
    }
    
    private func createTitleFormItem() -> FormItem {
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
        
        let titleItemViewModel = TitleFormItemViewModel(
            badgeImage: UIImage(named: "marvelBadge") ?? #imageLiteral(resourceName: "iTunesArtwork"),
            titleLabel: mutableAttributedString)
        return TitleFormItem(viewModel: titleItemViewModel)
    }
    
    private func createSearchFormItem() -> FormItem {
        let searchFormItemViewModel = SearchFormItemViewModel()
        return SearchFormItem(viewModel: searchFormItemViewModel)
    }
    
}

