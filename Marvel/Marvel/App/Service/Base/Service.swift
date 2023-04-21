//
//  ClientWrapper.swift
//  Marvel
//
//  Created by Luiz Henrique on 16/04/2023.
//

import UIKit

class Service {
    
    static let sharedInstance = Service()    
    let defaultSession: URLSession
    
    init() {
        let urlConf = URLSessionConfiguration.default
        self.defaultSession = URLSession(configuration: urlConf, delegate: nil, delegateQueue: .main)
    }
    
    func start(requestOperation: RequestOperation) {
        let sessionDataTask = defaultSession.dataTask(with: requestOperation.request, completionHandler: { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode

                guard let data = data, statusCode == 200 else {
                    requestOperation.failureOperation(ApiResponseCode.getApiResponse(statusCode: statusCode), nil, error)
                    return
                }
                requestOperation.successOperation(.success, data)                
            }else{
                requestOperation.failureOperation(.APIError, nil, error)
            }
        })
        sessionDataTask.resume()
    }
    
    func startImage(request: URLRequest, operationFinished: @escaping (Data?, Error?) -> Void) {
        let sessionDataTask = self.defaultSession.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            operationFinished(data, error)
        })
        sessionDataTask.resume()
    }
}
