//
//  FavoritesViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import UIKit

class FavoritesViewController: UITableViewController {
    var favorites: Set<songStruct> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let favoriteSongs = Array(favorites)
        cell.textLabel?.text = "\(favoriteSongs[indexPath.row].nameSong) - \(favoriteSongs[indexPath.row].duration)"
        return cell
    }
}

