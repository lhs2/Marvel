//
//  HeroListViewModel.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import Foundation
import Kingfisher

protocol HeroListViewModelProtocol {
    var numberOfHeroes: Int { get }
    var onLoading: (()->Void)? { get set }
    var stopLoading: (()->Void)? { get set }
    func getItemFor(indexPath: IndexPath) -> HeroItemViewModel
    func getImageFor(_ indexPath: IndexPath) -> KFCrossPlatformImage?
    func setImageFor(image: KFCrossPlatformImage?, for: IndexPath) 
    func getHeroList(with filteredName: String, completion: @escaping (Bool) -> Void)
    func fetchItems(with filteredName: String, completion: @escaping HeroListViewModel.GetHeroListCompletionBlock)
    func fetchPaginationItems(completion: @escaping HeroListViewModel.GetHeroListCompletionBlock)
}

final class HeroListViewModel: HeroListViewModelProtocol {
    typealias GetHeroListCompletionBlock = (Result<Bool, Error>) -> Void

    var marvelCharacters: [HeroItemViewModel] = []
    var offset: Int = 0
    var lastFilteredName: String = ""
    var service: HeroListServiceLogic
    var isLoading: Bool = false {
        didSet {
            if isLoading {
                onLoading?()
            } else {
                stopLoading?()
            }
        }
    }
    var canPaginate: Bool = true
    let currentOffset: Int = 0
    var onLoading: (() -> Void)?
    var stopLoading: (() -> Void)?
    
    init(_ service: HeroListServiceLogic = HeroListService()) {
        self.service = service
    }
    
    var numberOfHeroes: Int {
        return marvelCharacters.count
    }
    
    func getItemFor(indexPath: IndexPath) -> HeroItemViewModel {
        return marvelCharacters[indexPath.row]
    }
    
    func getImageFor(_ indexPath: IndexPath) -> KFCrossPlatformImage? {
        return marvelCharacters[indexPath.row].image
    }
    
    func setImageFor(image: KFCrossPlatformImage?, for indexPath: IndexPath) {
        return marvelCharacters[indexPath.row].image = image
    }
    
    func fetchItems(with filteredName: String = "", completion: @escaping HeroListViewModel.GetHeroListCompletionBlock) {
        getHeroList(with: filteredName) {  shouldReload in
            if shouldReload {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        }
    }
    
    func fetchPaginationItems(completion: @escaping HeroListViewModel.GetHeroListCompletionBlock) {
        getHeroList(with: lastFilteredName) {  shouldReload in
            if shouldReload {
                completion(.success(true))
            } else {
                completion(.success(false))
            }
        }
    }
        
    func getHeroList(with filteredName: String = "", completion: @escaping (Bool) -> Void) {
        
        guard !isLoading else {
            return
        }
    
        isLoading = true
        
        if filteredName != lastFilteredName {
            getHeroListPagination(with: filteredName, offset: 0) { [weak self] response in
                self?.marvelCharacters.removeAll()
                guard let marvelAPIResponse = response,
                      let marvelPagination = marvelAPIResponse.data else {
                    self?.canPaginate = false
                    self?.isLoading = false
                    return
                    // Raise error
                }
                self?.offset = (marvelPagination.offset ?? 0) + (marvelPagination.count ?? 0)
                self?.lastFilteredName = filteredName
                guard let heroList = marvelPagination.results else {
                    self?.canPaginate = false
                    self?.isLoading = false
                    return
                }
                self?.marvelCharacters = heroList.compactMap { return HeroItemViewModel.init(marvelCharacter: $0) }
                self?.isLoading = false
                completion(true)
            }
        }
        else if filteredName == lastFilteredName && canPaginate {
            getHeroListPagination(with: filteredName, offset: offset) { [weak self] response in
                guard let marvelAPIResponse = response,
                      let marvelPagination = marvelAPIResponse.data else {
                    self?.canPaginate = false
                    self?.isLoading = false
                    return
                    // Raise error
                }
                self?.offset = (marvelPagination.offset ?? 0) + (marvelPagination.count ?? 0)
                self?.lastFilteredName = filteredName
                guard let heroList = marvelPagination.results else {
                    self?.canPaginate = false
                    self?.isLoading = false
                    return
                }
                let newHeroList = heroList.compactMap { return HeroItemViewModel.init(marvelCharacter: $0) }
                self?.marvelCharacters.append(contentsOf: newHeroList)
                self?.isLoading = false
                completion(true)
            }
        }
        
    }
        
        private func getHeroListPagination(with name: String, offset: Int = 0, completion: @escaping (MarvelAPIResponse<MarvelCharacter>?) -> Void ) {
            var baseEndpoint = "v1/public/characters?"
            var pathParameters = [CVarArg]()
            if !name.isEmpty {
                baseEndpoint += "nameStartsWith=%@&"
                pathParameters.append(name)
            }
            baseEndpoint += "offset=%@"
            pathParameters.append("\(offset)")
            
            let endpoint = BaseEndpoint(endpoint: baseEndpoint, pathParameters: pathParameters)
            service.getHeroList(endpoint: endpoint) { response in
                guard let marvelAPIResponse = response  else {
                    completion(nil)
                    return
                }
                completion(marvelAPIResponse)
                
            }
        }
    

    
}
