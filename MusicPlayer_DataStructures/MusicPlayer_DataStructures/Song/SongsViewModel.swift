//
//  SongsViewModel.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 19/07/24.
//

import Combine
import Foundation

final class SongsViewModel: ObservableObject {
    //publica la información que la vista necesita -> Song
    @Published private(set) var songs: [Song] = []
    let interactor: ArtistInteractor
    private let artist: String
    private let album: String
    
    init(interactor: ArtistInteractor, artist: String, album: String) {
        self.interactor = interactor
        self.album = album
        self.artist = artist
        setupBindings()
    }
    
    func setupBindings() { // [Artist] -> Transform -> [Songs]
        interactor.artistsPublisher
            .map { [weak self] artists -> [Song] in
                let artist = artists
                    .first { $0.name == self?.artist }
                let album = artist?.albums
                    .first { $0.title == self?.album }
                let songs = album?.songs ?? []
                return songs
            }
            .assign(to: &$songs)
    }
}
