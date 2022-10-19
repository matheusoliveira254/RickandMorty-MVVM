//
//  APIService.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/17/22.
//

import UIKit

struct APIService {
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, ResultError>) -> Void) {
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {completion(.failure(.requestError(error))); return}
            
            if let response = response as? HTTPURLResponse {
                print("Completed with response of", response.statusCode)
            }
            
            guard let data else {completion(.failure(.noData)); return}
            completion(.success(data))
        }.resume()
    }
}//Error class
