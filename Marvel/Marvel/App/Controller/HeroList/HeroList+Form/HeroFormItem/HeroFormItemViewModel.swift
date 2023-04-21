//
//  HeroFormItemViewModel.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit
import Kingfisher

class HeroFormItemViewModel {
    var items: [HeroItemViewModel] = []
    var offset: Int = 0
    var lastFilteredName: String = ""
    var service: HeroCollectionFormItemServiceProtocol
    var isLoading: Bool = false
    var canPaginate: Bool = true
    
    var numberOfItems: Int {
        return items.count
    }
    
    func getItemBy(_ indexPath: IndexPath) -> HeroItemViewModel {
        return items[indexPath.row]
    }
    
    func getImageBy(_ indexPath: IndexPath) -> UIImage? {
        return items[indexPath.row].image
    }
    
    init(service: HeroCollectionFormItemServiceProtocol = HeroCollectionFormItemService()) {
        self.service = service
    }
    
    func getHeroList(with filteredName: String = "", completion: @escaping (Bool) -> Void) {
        
        guard !isLoading else {
            return
        }
        
        isLoading = true
        
        if filteredName != lastFilteredName {
            getHeroListPagination(with: filteredName, offset: 0) { [weak self] response in
                self?.items.removeAll()
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
                self?.items = heroList.compactMap { return HeroItemViewModel.init(marvelCharacter: $0) }
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
                self?.items.append(contentsOf: newHeroList)
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

struct HeroItemViewModel {
    let imagePath: URL?
    let heroName: String
    let id: Int
    var image: KFCrossPlatformImage?
    var marvelCharacter: MarvelCharacter
    
    init?(marvelCharacter: MarvelCharacter) {
        guard let thumbnail = marvelCharacter.thumbnail,
              let heroName = marvelCharacter.name,
              let id = marvelCharacter.id else {
            return nil
        }
        self.id = id
        self.imagePath = thumbnail.url
        self.heroName = heroName
        self.marvelCharacter = marvelCharacter
    }
    
}
