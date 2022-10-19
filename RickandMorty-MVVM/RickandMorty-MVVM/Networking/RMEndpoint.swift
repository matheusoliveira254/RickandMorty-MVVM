//
//  CharacterSearchEndpoint.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/18/22.
//

import Foundation

enum RMFilterEndpoint {
    case name(String)
    case gender(String)
    case species(String)
    case status(String)
    
    var endPoint: String {
        switch self {
        case .name:
            return "name"
        case .gender:
            return "gender"
        case .species:
            return "species"
        case .status:
            return "status"
        }
    }
    //computed property
    var fullURL: URL? {
        guard var baseURL = URL(string: "https://rickandmortyapi.com/api/") else {return nil}
        let characterURL = baseURL.appending(path: "character")
        
        switch self {
        case .name(let searchTerm), .species(let searchTerm), .gender(let searchTerm), .status(let searchTerm):
            
            guard var components = URLComponents(url: characterURL, resolvingAgainstBaseURL: true) else {return nil}
            
            let filterQueryItem = URLQueryItem(name: endPoint, value: searchTerm)
            components.queryItems = [filterQueryItem]
            return components.url
        }
    }
}
