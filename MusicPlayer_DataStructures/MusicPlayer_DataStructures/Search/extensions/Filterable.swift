//
//  Filterable.swift
//  MusicPlayer_DataStructures
//
//  Created by julian.garcia on 22/07/24.
//

import Foundation

protocol Filterable: Hashable {
    func getuidString() -> String
}

extension Artist: Filterable {
    func getuidString() -> String {
        return "Artist: " + self.name
    }
}

extension Song: Filterable {
    func getuidString() -> String {
        return "Song: " + self.title
    }
}

extension Album: Filterable {
    func getuidString() -> String {
        return "Album: " + self.title
    }
}
