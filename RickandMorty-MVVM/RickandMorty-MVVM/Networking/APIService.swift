//
//  APIService.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/17/22.
//

import Foundation

struct APIService {
    
    static let baseURLString = "https://rickandmortyapi.com/api"
    static let kCharacter = "character"
    static let kName = "name"
    
    static func fetchCharacters(with searchTerm: String, completion: @escaping (Result<TopLevelDictionary, ResultError>) -> Void) {
        
        guard let baseUrl = URL(string: baseURLString) else {completion(.failure(.badURL)); return}
        
        let characterURL = baseUrl.appendingPathComponent(kCharacter)
        var urlComponents = URLComponents(url: characterURL, resolvingAgainstBaseURL: true)
        let nameFilter = URLQueryItem(name: kName, value: searchTerm)
        urlComponents?.queryItems?.append(nameFilter)
        
        guard let finalURL = urlComponents?.url else {completion(.failure(.badURL)); return}
        
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            if let error {
                completion(.failure(.requestError(error)))
                return
            }
            
            guard let data else {completion(.failure(.noData)); return}
            
            do {
                guard let tld = try? JSONDecoder().decode(TopLevelDictionary.self, from: data) else {completion(.failure(.couldNotUnwrap))
                    return
                }
                completion(.success(tld))
            }
            completion(.failure(.errorDecoding))
        }.resume()
    }
}