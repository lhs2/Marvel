//
//  MarvelCharacter.swift
//  Marvel
//
//  Created by Luiz Henrique on 16/04/2023.
//

import Foundation

struct MarvelCharacter : Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: MarvelThumbnail?
    let comic: MarvelCharacterComic?
    let series: MarvelCharacterSeries?
    let stories: MarvelCharacterStories?
    let events: MarvelCharacterEvents?
}

struct MarvelCharacterComic: Codable {
    let collectionURI: String?
}

struct MarvelCharacterSeries: Codable {
    let collectionURI: String?
}

struct MarvelCharacterStories: Codable {
    let collectionURI: String?
}

struct MarvelCharacterEvents: Codable {
    let collectionURI: String?
}


