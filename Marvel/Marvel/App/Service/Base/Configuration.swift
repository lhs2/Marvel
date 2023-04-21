//
//  Configuration.swift
//  Marvel
//
//  Created by Luiz Henrique on 16/04/2023.
//

import Foundation
import UIKit

enum ApiResponseCode: NSInteger {
    case success                = 0
    case authorizationError     = 1
    case timeOut                = 2
    case badUrl                 = 3
    case unknownError           = 4
    case APIError               = 5
    case noInternetConnection   = 6
    case parse                  = 7
    
    var httpCode: Int {
        switch self {
        case .noInternetConnection:
            return NSURLErrorNotConnectedToInternet
        case .timeOut:
            return NSURLErrorTimedOut
        default:
            return 404
        }
    }
    
    static func getApiResponse(statusCode: Int) -> ApiResponseCode {
        
        switch statusCode
        {
        case NSURLErrorCannotFindHost, NSURLErrorNotConnectedToInternet:
            return ApiResponseCode.noInternetConnection
        case NSURLErrorTimedOut:
            return ApiResponseCode.timeOut
        case 231, 401:
            return ApiResponseCode.authorizationError
        default:
            return ApiResponseCode.unknownError
        }
    }
    
}

enum HttpResponse: String {
    case post   = "POST"
    case get    = "GET"
    case put    = "PUT"
    case delete = "DELETE"
}

enum URLCacheType: NSInteger {
    case noCache  = 0
    case memory   = 1
    case database = 2
}


enum URLCacheTime: NSInteger {
    case none      = 0
    case `default` = 1800
    case extended  = 3600
}

