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
    private let service = CharacterSearchService()
    //Dependency Injection
    init(delegate: CharacterListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchCharacters(with name: String) {
        service.fetchCharacterList(for: .name(name)) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.errorDescription)
            case .success(let tld):
                self?.characters = tld.results
                DispatchQueue.main.async {
                    self?.delegate?.updateViews()
                }
            }
        }
    }
}
