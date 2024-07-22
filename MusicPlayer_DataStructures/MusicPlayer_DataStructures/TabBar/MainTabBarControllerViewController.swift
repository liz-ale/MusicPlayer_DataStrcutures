//
//  MainTabBarControllerViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import UIKit

class MainTabBarControllerViewController: UITabBarController {
    
    //inyectaremos el interactor a los ViewModel
    private let interactor = FakeArtistInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //flujo del artista: 3 pantallas
        //cada uno consulta a interactor para los datos
        let artistsViewModel = ArtistsViewModel(interactor: interactor)
        let artistsViewController = ArtistsViewController(viewModel: artistsViewModel)
        let artistsNavController = UINavigationController(rootViewController: artistsViewController)
        artistsNavController.tabBarItem = UITabBarItem(title: "Artists", image: UIImage(systemName: "music.note.list"), tag: 0)
        
        //flujo favoritos
        let favoritesVC = UINavigationController(rootViewController: FavoritesViewController())
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 1)
        
        viewControllers = [artistsNavController, favoritesVC]
    }
    
}
