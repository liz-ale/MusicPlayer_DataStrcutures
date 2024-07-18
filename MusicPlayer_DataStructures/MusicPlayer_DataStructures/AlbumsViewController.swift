//
//  AlbumsViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import UIKit

class AlbumsViewController: UITableViewController {
    var albums: [albumStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = albums[indexPath.row].nameAlbum
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let songsVC = SongsViewController()
        songsVC.songs = albums[indexPath.row].songAlbum
        navigationController?.pushViewController(songsVC, animated: true)
    }
}

