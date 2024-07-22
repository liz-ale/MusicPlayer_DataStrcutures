//
//  Album.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 18/07/24.
//

import Foundation

struct Album: Hashable, Codable {
    var title: String
    var year: String
    var songs: [Song]
}
