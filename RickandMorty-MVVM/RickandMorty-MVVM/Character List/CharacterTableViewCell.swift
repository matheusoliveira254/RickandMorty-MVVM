//
//  CharacterTableViewCell.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/17/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageImageView: ServiceRequestImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageImageView.image = nil
    }
    
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
        characterImageImageView.fetch(using: imageURL)
    }
}
