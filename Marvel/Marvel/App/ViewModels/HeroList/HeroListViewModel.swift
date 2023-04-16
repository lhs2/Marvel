//
//  HeroListViewModel.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import Foundation

protocol HeroListViewModelProtocol {
    func fetchItems(completion: @escaping HeroListViewModel.GetHeroListCompletionBlock)
}

final class HeroListViewModel: HeroListViewModelProtocol {
    
    typealias GetHeroListCompletionBlock = (Result<HeroListLayoutViewModel, Error>) -> Void
    
    let service: HeroListServiceLogic
    
    init(_ service: HeroListServiceLogic = HeroListService()) {
        self.service = service
    }
    
    func fetchItems(completion: @escaping HeroListViewModel.GetHeroListCompletionBlock) {
        getHeroList() { response in
            switch response {
            case .success(let formItems):
                let layout = HeroListLayoutViewModel(formItems: formItems)
                completion(.success(layout))
            case .failure(_):
                ///TODO: Error
                fatalError("Error")
            }
        }
    }
    
    private func getHeroList(completion: @escaping (Result<[FormItem], Error>) -> Void) {
        service.getHeroList() { response in
            guard let formItems = response else {
                /// TODO: Error
                return
            }
            completion(.success(formItems))
        }
    }
    
}
