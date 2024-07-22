//
//  SearchViewModel.swift
//  MusicPlayer_DataStructures
//
//  Created by julian.garcia on 22/07/24.
//

import Foundation

final class SearchViewModel: ObservableObject {
    @Published private(set) var results: [Artist] = []
    @Published private(set) var filteredResults: [String] = []
    @Published private(set) var filterText: String = ""
    
    let interactor: ArtistInteractor
    
    init(interactor: ArtistInteractor) {
        self.interactor = interactor
        setupBindings()
    }
    //el view model se debera suscribir al interactor para obtener los datos
    //interactor solo publica datos de los Artistas
    //a partir de mi fuente de datos, el interactor me devolvera al obj ARTISTA
    private func setupBindings() {
        //publica los artistas
        interactor.artistsPublisher
        //Asigna el resltado a mi artistas @Publisher artists -> el que publicara en la vista los datos
            .assign(to: &$results)
        
        $filterText
            .throttle(for: 1.0, scheduler: RunLoop.main, latest: true)
            .removeDuplicates()
            .compactMap {[weak self] text in
                guard let self = self else { return [] }
                
                if text.isEmpty {
                    return []
                } else {
                    var filtered: [String] = []
                    
                    self.results.forEach { artist in
                        if artist.name.localizedCaseInsensitiveContains(text) {
                            filtered.append(artist.getuidString())
                        }
                        artist.albums.forEach { album in
                            if album.title.localizedCaseInsensitiveContains(text) {
                                filtered.append(album.getuidString())
                            }
                            album.songs.forEach { song in
                                if song.title.localizedCaseInsensitiveContains(text) {
                                    filtered.append(song.getuidString())
                                }
                            }
                        }
                        
                    }
                    
                    return filtered
                }
            }
            .assign(to: &$filteredResults)
    }
    
    func filterWith(text: String) {
        filterText = text
    }
}
