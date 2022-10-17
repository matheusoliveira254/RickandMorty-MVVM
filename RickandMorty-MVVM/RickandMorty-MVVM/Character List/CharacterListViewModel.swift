//
//  CharacterListViewModel.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/17/22.
//

import Foundation

protocol CharacterListViewModelDelegate: AnyObject {
    func updateViews()
}

class CharacterListViewModel {
    
    var characters: [Character] = []
    weak var delegate: CharacterListViewModelDelegate?
    
    //Dependency Injection
    init(delegate: CharacterListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchCharacters(with name: String) {
        APIService.fetchCharacters(with: name) { result in
            switch result {
            case .failure(let error):
                print(error.errorDescription)
            case .success(let tld):
                self.characters = tld.results
                DispatchQueue.main.async {
                    self.delegate?.updateViews()
                }
            }
        }
    }
}
