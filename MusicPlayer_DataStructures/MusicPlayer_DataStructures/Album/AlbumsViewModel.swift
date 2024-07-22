//
//  AlbumsViewModel.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 19/07/24.
//

import Combine
import Foundation

final class AlbumsViewModel: ObservableObject {
    
    @Published private(set) var albums: [Album] = []
    @Published private(set) var currentArtist: Artist
    let interactor: ArtistInteractor
    private let artist: Artist
    
    init(artistInteractor: ArtistInteractor, artist: Artist) {
        self.interactor = artistInteractor
        self.artist = artist
        self.currentArtist =  artist
        setupBindings()
    }
    
    private func setupBindings() {
        
        //al suscribirnos nos regresara una lista de Artistas, pero quiero un album...entonces aplico mi tratamiento de datos
        interactor.artistsPublisher
        //transforma los datos complejos a datos sencillos para que la vista pueda presentarlos
            .map { [weak self] artists -> [Album] in
                let aritst = artists.first { $0.name == self?.artist.name }
                return aritst?.albums ?? []
            }
        //el resultado lo guardo en el publicador album,
        //oara que después lo presente en la siguiente capa de la vist
            .assign(to: &$albums)
    }
}
