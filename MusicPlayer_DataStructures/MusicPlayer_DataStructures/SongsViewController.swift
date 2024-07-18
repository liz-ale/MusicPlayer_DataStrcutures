//
//  SongsViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import UIKit

class SongsViewController: UITableViewController {
    var songs: [songStruct] = []
    var favorites: Set<songStruct> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Songs"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(songs[indexPath.row].nameSong) - \(songs[indexPath.row].duration)"
        return cell
    }
        
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favoriteAction = UIContextualAction(style: .normal, title: nil) { _, _, completion in
            self.favorites.insert(self.songs[indexPath.row])
            completion(true)
        }
        favoriteAction.image = UIImage(systemName: "heart.circle.fill")
        favoriteAction.backgroundColor = .systemPink
        
        let config = UISwipeActionsConfiguration(actions: [favoriteAction])
        return config
    }
}

