//
//  RequestOperation.swift
//  Marvel
//
//  Created by Luiz Henrique on 16/04/2023.
//

import Foundation

class RequestOperation {
    
    let request: URLRequest
    init(withRequest request: URLRequest) {
        
        self.request = request
    }
    
    typealias OperationSuccessType = (ApiResponseCode, Data) -> Void
    typealias OperationFailureType = (ApiResponseCode, Data?, Error?) -> Void
    
    var successOperation : OperationSuccessType!
    var failureOperation : OperationFailureType!
    
}
