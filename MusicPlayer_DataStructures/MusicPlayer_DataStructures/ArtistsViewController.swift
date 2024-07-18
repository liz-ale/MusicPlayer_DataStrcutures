//
//  ArtistsViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import UIKit

class ArtistsViewController: UITableViewController {
    var albumManager = AlbumManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Artists"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumManager.playList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = albumManager.playList[indexPath.row].nameArtist
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumsVC = AlbumsViewController()
        albumsVC.albums = albumManager.playList[indexPath.row].albumArtist
        navigationController?.pushViewController(albumsVC, animated: true)
    }
}

