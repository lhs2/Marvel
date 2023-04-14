//
//  AboutViewModel.swift
//  Marvel
//
//  Created by Luiz Henrique on 13/04/2023.
//

import Foundation

protocol AboutViewModelProtocol {
    func fetchItems(completion: @escaping AboutViewModel.GetAboutItemsCompletionBlock)
}

final class AboutViewModel: AboutViewModelProtocol {
    
    typealias GetAboutItemsCompletionBlock = (Result<AboutLayoutViewModel, Error>) -> Void
    
    let service: AboutServiceLogic
    
    init(_ service: AboutServiceLogic = AboutService()) {
        self.service = service
    }
    
    func fetchItems(completion: @escaping AboutViewModel.GetAboutItemsCompletionBlock) {
        getItems() { response in
            switch response {
            case .success(let items):
                let layoutViewModel = AboutLayoutViewModel(items: items)
                completion(.success(layoutViewModel))
                
            case .failure(_):
                /// TODO: Implement error case
                fatalError("Not implemented error")
            }
            
        }
    }
    
    private func getItems(completion: @escaping (Result<[AboutCollectionViewCellModel], Error>) -> Void) {
        service.getAboutItems() { response in
            if let items = response {
                completion(.success(items))
            }
            
        }
    }
    
}
