//
//  MarvelAPIResponse.swift
//  Marvel
//
//  Created by Luiz Henrique on 16/04/2023.
//

import Foundation

struct MarvelAPIResponse<T>: Codable where T: Codable {
    let code: Int?
    let status: String?
    let data: MarvelAPIPagination<T>?
}
