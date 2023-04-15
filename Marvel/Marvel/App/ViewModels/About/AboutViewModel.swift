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
        getAboutLayourItems() { response in
            switch response {
            case .success(let layout):
                completion(.success(layout))
                
            case .failure(_):
                /// TODO: Implement error case
                fatalError("Not implemented error case")
            }
            
        }
    }
    
    private func getAboutLayourItems(completion: @escaping (Result<AboutLayoutViewModel, Error>) -> Void) {
        service.getAboutLayoutItems() { response in
            guard let items = response else {
                fatalError("not implemented error case")
            }
            completion(.success(items))
            
        }
    }
    
}
