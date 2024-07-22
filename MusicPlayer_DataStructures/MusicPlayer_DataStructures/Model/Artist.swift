//
//  DataModel.swift
//  MusicPlayer_DataStructures
//
//  Created by lizbeth.alejandro on 17/07/24.
//

import Foundation

struct Artist: Hashable, Codable {
    var name: String
    var albums: [Album]
}
