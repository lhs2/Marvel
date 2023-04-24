//
//  MarvelComic.swift
//  Marvel
//
//  Created by Luiz Henrique on 16/04/2023.
//

import Foundation

struct MarvelComic: Codable {
    let id: Int?
    let title: String?
    let thumbnail: MarvelThumbnail?
}
