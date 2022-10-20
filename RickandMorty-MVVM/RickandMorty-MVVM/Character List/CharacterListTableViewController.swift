//
//  CharacterListTableViewController.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/17/22.
//

import UIKit

class CharacterListTableViewController: UITableViewController {

    @IBOutlet weak var characterSearchBar: UISearchBar!
    
    private var viewModel: CharacterListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CharacterListViewModel(delegate: self)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterTableViewCell else {return UITableViewCell()}
        let character = viewModel.characters[indexPath.row]
        cell.configure(with: character)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toDetailVC",
              let indexPath = tableView.indexPathForSelectedRow,
              let destination = segue.destination as? CharacterDetailViewController,
        let cell = sender as? CharacterTableViewCell else {return}
        let image = cell.characterImageImageView.image
        
        let character = viewModel.characters[indexPath.row]
        destination.configure(with: character, and: image)
    }
    
    
}//End of Class

extension CharacterListTableViewController: CharacterListViewModelDelegate {
    func updateViews() {
        tableView.reloadData()
    }
}

extension CharacterListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchCharacters(with: searchText)
    }
}
