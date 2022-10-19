//
//  CharacterTableViewCell.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/17/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    private let apiService = APIService()
    //Helper Function
    func configure(with character: Character) {
        characterNameLabel.text = character.name
        fetchImage(for: character)
        makeRounded()
    }
    
    func makeRounded() {
        characterImageImageView.layer.cornerRadius = characterImageImageView.frame.size.width / 2
        characterImageImageView.clipsToBounds = true
    }
    
    func fetchImage(for character: Character) {
        guard let imageURL = URL(string: character.imageString) else {return}
        let request = URLRequest(url: imageURL)
        apiService.perform(request) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.errorDescription)
            case .success(let data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.characterImageImageView.image = image
                }
            }
        }
    }
}
