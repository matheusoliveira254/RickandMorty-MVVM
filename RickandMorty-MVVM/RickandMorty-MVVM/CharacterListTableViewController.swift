//
//  CharacterListTableViewController.swift
//  RickandMorty-MVVM
//
//  Created by Matheus Oliveira on 10/17/22.
//

import UIKit

class CharacterListTableViewController: UITableViewController {

    @IBOutlet weak var characterSearchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}//End of Class