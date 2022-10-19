//
//  CharacterDetailViewController.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/19/22.
//

import UIKit

class CharacterDetailViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var characterIDLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageImageView: UIImageView!
    @IBOutlet weak var characterStatusLabel: UILabel!
    @IBOutlet weak var characterCurrentLocationLabel: UILabel!
    @IBOutlet weak var characterSpecieLabel: UILabel!
    @IBOutlet weak var characterOriginLabel: UILabel!
    @IBOutlet weak var characterGenderLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configure(with character: Character, and image: UIImage?) {
        loadViewIfNeeded()
        if let image {
            characterImageImageView.image = image
        }
        characterNameLabel.text = character.name
        characterStatusLabel.text = "Status: \(character.status)"
        characterGenderLabel.text = character.gender
        characterSpecieLabel.text = character.species
        characterOriginLabel.text = character.origin.name
        characterCurrentLocationLabel.text = character.location.name
        characterIDLabel.text = "ID: \(character.id)"
    }
}
