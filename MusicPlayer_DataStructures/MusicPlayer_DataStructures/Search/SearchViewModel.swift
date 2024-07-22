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
            .removeDuplicates()
            .throttle(for: 1.0, scheduler: RunLoop.main, latest: true)
            .compactMap {[weak self] text in
                guard let self = self else { return [] }
                
                if text.isEmpty {
                    return []
                } else {
                    var filtered: [String] = []
                    
                    // Artists
                    filtered += self.results.filter { artist in
                        artist.name.localizedCaseInsensitiveContains(text)
                    }.compactMap { $0.getuidString() }
                    
                    // Albums
                    filtered += self.results.map { artist in
                        artist.albums.filter { album in
                            album.title.localizedCaseInsensitiveContains(text)
                        }
                    }.reduce(into: []) { partialResult, albums in
                        partialResult += albums
                    }.compactMap { $0.getuidString() }
                    
                    // Songs
                    filtered += self.results.map { artist in
                        artist.albums.map { album in
                            album.songs.filter { song in
                                song.title.localizedCaseInsensitiveContains(text)
                            }
                        }.reduce(into: []) { partialResult, songs in
                            partialResult += songs
                        }
                    }.reduce(into: []) { partialResult, songs in
                        partialResult += songs
                    }.compactMap { $0.getuidString() }
                    
                    return filtered
                }
            }
            .assign(to: &$filteredResults)
    }
    
    func filterWith(text: String) {
        filterText = text
    }
}
