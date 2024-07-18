//
//  AlbumManager.swift
//  MusicPlayer_DataStructures
//
//  Created by julian.garcia on 17/07/24.
//

import Foundation

class AlbumManager {
    let playList: [artistStruct] = [
    artistStruct(nameArtist: "Beirut", albumArtist: [
        albumStruct(nameAlbum: "Gulag Orkestar", nameArtist: "Beirut", year: "2006", songAlbum: [
            songStruct(nameSong: "Postcards from Italy", duration: "2:06"),
            songStruct(nameSong: "Branderburg", duration: "4:48"),
            songStruct(nameSong: "The Bunker", duration: "4:50"),
            songStruct(nameSong: "The Bunker", duration: "4:50"),
            songStruct(nameSong: "The Bunker", duration: "4:50"),
        ]),
        albumStruct(nameAlbum: "The Rip Tide", nameArtist: "Beirut", year: "2011", songAlbum: [
            songStruct(nameSong: "Santa Fe", duration: "2:13"),
            songStruct(nameSong: "Goshen", duration: "4:40"),
            songStruct(nameSong: "Vagabond", duration: "4:39"),
        ]),
        albumStruct(nameAlbum: "Gallipoli", nameArtist: "Beirut", year: "2019", songAlbum: [
            songStruct(nameSong: "Corfu", duration: "3:17"),
            songStruct(nameSong: "Landslide", duration: "4:16"),
            songStruct(nameSong: "Family Curse", duration: "4:39"),
        ]),
    ]),
    
    artistStruct(nameArtist: "Interpol", albumArtist: [
        albumStruct(nameAlbum: "Our Love To Admire", nameArtist: "Interpol", year: "2007", songAlbum: [
            songStruct(nameSong: "The Scale", duration: "2:23"),
            songStruct(nameSong: "Rest My Chemistry", duration: "5:38"),
            songStruct(nameSong: "Mind Over Time", duration: "7:47"),
        ]),
        albumStruct(nameAlbum: "El Pintor", nameArtist: "Interpol", year: "2014", songAlbum: [
            songStruct(nameSong: "All the Rage Back Home", duration: "4:22"),
            songStruct(nameSong: "My Desire", duration: "5:00"),
            songStruct(nameSong: "Anywhere", duration: "4:11"),
        ]),
        albumStruct(nameAlbum: "The Other Side OF Make-Believe", nameArtist: "Interpol", year: "2009", songAlbum: [
            songStruct(nameSong: "Toni", duration: "3:20"),
            songStruct(nameSong: "Mr. Credit", duration: "4:47"),
            songStruct(nameSong: "Gran Hotel", duration: "5:44"),
        ]),
    ]),
]
    var favorites: Set<songStruct> = []
    
    static public let shared = AlbumManager()
    
    private init() {}
}
