//
//  HeroListService.swift
//  Marvel
//
//  Created by Luiz Henrique on 15/04/2023.
//

import UIKit

protocol HeroListServiceLogic {
    func getHeroList(endpoint: EndpointProtocol, completion: @escaping (MarvelAPIResponse<MarvelCharacter>?) -> Void)
}

final class HeroListService: HeroListServiceLogic {
   
    func getHeroList(endpoint: EndpointProtocol, completion: @escaping (MarvelAPIResponse<MarvelCharacter>?) -> Void)
    {
        fetchHeroList(with: endpoint) { response in
            if let response = response {
                completion(response)
            }
            
        }
    }
    
    private func fetchHeroList(with endpoint: EndpointProtocol, completion: @escaping (MarvelAPIResponse<MarvelCharacter>?) -> Void) {
        let client = Service.sharedInstance
        
        var request = URLRequest(url: endpoint.url, cachePolicy: endpoint.cacheType, timeoutInterval: endpoint.cacheTime)
        request.httpMethod = endpoint.method.rawValue
        request.timeoutInterval = 20
        
        let requestOperation = RequestOperation(withRequest: request)
        requestOperation.successOperation = { apiResponseCode, data in
            do {
                let apiResponse = try JSONDecoder().decode(MarvelAPIResponse<MarvelCharacter>.self, from: data)
                completion(apiResponse)
            } catch {
                completion(nil)
            }
        }
        requestOperation.failureOperation = { apiResponseCode, object, error in
            completion(nil)
        }
        
        client.start(requestOperation: requestOperation)
        
    }

}

