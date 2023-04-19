//
//  EndpointProtocol.swift
//  Marvel
//
//  Created by Luiz Henrique on 16/04/2023.
//

import UIKit
import Foundation

protocol EndpointProtocol {

    var url: URL { get }
    var method: HttpResponse { get }

    var contentType: String { get }
    var baseUrlString: String { get }

    var cacheType: NSURLRequest.CachePolicy { get }
    var cacheTime: TimeInterval { get }

    var endpoint: String { get set }
    var pathParameters: [CVarArg]? { get set }
    var parameters: Dictionary<String, Any>? { get }
    var bodyData: Data? { get }
}

extension EndpointProtocol {
    
    var baseUrlString : String {
        return "http(s)://gateway.marvel.com/"
    }
    
    private var apiPrivateKey : String {
        return "926153c8bd76cb69dbf71c7f754e5e06b59ae9ef"
    }
    
    private var apiPublicKey: String {
        return "4efd2b05079adff17b5ce8a220bdf6ea"
    }
    
    var method: HttpResponse {
        return .get
    }
    
    var contentType: String {
        return "application/json; charset=utf-8"
    }

    var cacheType: NSURLRequest.CachePolicy {
        return .reloadIgnoringLocalCacheData
    }
    
    var cacheTime: TimeInterval {
        return TimeInterval(URLCacheTime.default.rawValue)
    }
    
    var bodyData: Data? {
        if method == .get {
            return nil
        }
        return nil
    }
    
    var parametersString: String {
        guard let pathParameters = pathParameters,
                !pathParameters.isEmpty else {
            return securityParameter
        }
        return String.init(format: endpoint + securityParameter, pathParameters)
    }
    
    var url: URL {
        let fullPath = "https://gateway.marvel.com/" + parametersString
        return URL(string: fullPath) ?? URL(fileURLWithPath: fullPath)
    }
    
    var securityParameter: String {
        let timestamp = "\(Date.timestamp)"
        let hash = Data.MD5(timestamp: timestamp, privateKey: apiPrivateKey, publicKey: apiPublicKey) .map { String(format: "%02hhx", $0) }.joined()
        return "&apikey=\(apiPublicKey)&ts=\(timestamp)&hash=\(hash)"
                        
    }
        
}

struct BaseEndpoint: EndpointProtocol {
    var endpoint: String
    var pathParameters: [CVarArg]?
    var parameters: Dictionary<String, Any>?

    init(endpoint: String, pathParameters: [CVarArg]? = nil) {
        self.endpoint = endpoint
        self.pathParameters = pathParameters
    }
    
}
