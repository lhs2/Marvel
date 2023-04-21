//
//  MarvelAPIPagination.swift
//  Marvel
//
//  Created by Luiz Henrique on 16/04/2023.
//

import Foundation

struct MarvelAPIPagination<T>: Codable where T:Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [T]?
}
