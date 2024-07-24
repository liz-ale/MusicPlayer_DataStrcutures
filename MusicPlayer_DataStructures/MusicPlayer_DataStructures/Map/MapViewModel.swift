//
//  MapViewModel.swift
//  MusicPlayer_DataStructures
//
//  Created by julian.garcia on 24/07/24.
//

import Foundation

final class MapViewModel: ObservableObject {
    @Published private(set) var mapElementArtists: [MapArtistElement]
    @Published private(set) var selectedArtist: MapArtistElement?
    
    init(mapElementArtists: [MapArtistElement] = MapArtistElement.defaultValues() ) {
        self.mapElementArtists = mapElementArtists
    }
    
    func didSelectArtistWith(title: String) {
        if let artist = mapElementArtists.first(where: { mapElementArtist in
            mapElementArtist.name == title
        }) {
            selectedArtist = artist
        } else {
            selectedArtist = nil
        }
    }
}


