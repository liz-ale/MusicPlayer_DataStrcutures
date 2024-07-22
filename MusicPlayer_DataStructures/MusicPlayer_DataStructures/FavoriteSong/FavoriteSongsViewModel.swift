//
//  FavoriteSongsViewModel.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 19/07/24.
//

import Combine
import Foundation

final class FavoriteSongsViewModel: ObservableObject {
    @Published private(set) var favSongs: Set<Song> = .init()
    
    //Define una instancia estática y única de FavoriteSongsViewModel
    //implementación del patron creacional Singleton
    // en todas las partes de la aplicación usen la misma instancia para acceder a las canciones favoritas
    static let shared = FavoriteSongsViewModel()
    
    func addSong(_ song: Song) {
        favSongs.insert(song)
    }
}

