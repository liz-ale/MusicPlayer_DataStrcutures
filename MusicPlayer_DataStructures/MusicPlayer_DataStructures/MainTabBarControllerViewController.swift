//
//  MainTabBarControllerViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import UIKit

class MainTabBarControllerViewController: UITabBarController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            let artistsVC = UINavigationController(rootViewController: ArtistsViewController())
            artistsVC.tabBarItem = UITabBarItem(title: "Artists", image: UIImage(systemName: "music.note.list"), tag: 0)
            
            let favoritesVC = UINavigationController(rootViewController: FavoritesViewController())
            favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)
            
            viewControllers = [artistsVC, favoritesVC]
        }

}
