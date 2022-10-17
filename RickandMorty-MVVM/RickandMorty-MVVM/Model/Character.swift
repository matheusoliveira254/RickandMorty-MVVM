//
//  File.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/17/22.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let info: Info
    let results: [Character]
}

struct Info: Decodable {
    //Next is the URL used for pagination
    let next: String
}

//Dictionary whitin the results array = Character
struct Character: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case gender
        case origin
        case location
        case imageString = "image"
    }
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: OriginDictionary
    let location: LocationDictionary
    let imageString: String
}

struct OriginDictionary: Decodable {
    let name: String
}

struct LocationDictionary: Decodable {
    let name: String
}
