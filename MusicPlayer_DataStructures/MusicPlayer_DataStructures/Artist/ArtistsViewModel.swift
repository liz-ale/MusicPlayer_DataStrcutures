//
//  ArtistViewModel.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 19/07/24.
//

import Combine
import Foundation

final class ArtistsViewModel: ObservableObject  {
    //@published permite que las vistas suscritas sean notificadas cuando la propiedad cambia.
    //private(set): Indica que la propiedad solo puede ser modificada dentro de la clase, pero puede ser leída desde fuera.
    @Published private(set) var artists: [Artist] = []
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
            .print()
            //Asigna el resltado a mi artistas @Publisher artists -> el que publicara en la vista los datos
            .assign(to: &$artists)
    }
    
}
