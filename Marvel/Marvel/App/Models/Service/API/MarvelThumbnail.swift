//
//  MarvelThumbnail.swift
//  Marvel
//
//  Created by Luiz Henrique on 16/04/2023.
//

import Foundation

struct MarvelThumbnail: Codable {
    private let path: String
    private let `extension`: String
    
    var url: URL? { URL(string: "\(path).\(`extension`)") }
    var fullPath: String { return "\(path).\(`extension`)"}
}
