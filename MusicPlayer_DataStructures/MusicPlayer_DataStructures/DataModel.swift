//
//  DataModel.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import Foundation

struct artistStruct {
    var nameArtist: String
    var albumArtist: [albumStruct]
}

struct albumStruct {
    var nameAlbum: String
    var nameArtist: String
    var year: String
    var songAlbum: [songStruct]
}

struct songStruct: Hashable {
    var nameSong: String
    var duration: String
}
