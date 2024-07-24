//
//  MapDetailViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by julian.garcia on 24/07/24.
//

import UIKit

class MapDetailViewController: UIViewController {
    var artist: MapArtistElement
    
    private let artistLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let countryLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let coordinatesLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    init(artist: MapArtistElement) {
        self.artist = artist
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(artistLabel)
        view.addSubview(countryLabel)
        view.addSubview(coordinatesLabel)
        
        artistLabel.text = artist.name
        countryLabel.text = artist.country.rawValue
        coordinatesLabel.text = artist.coordinates.to2DString
        
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        coordinatesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            countryLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 10),
            countryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            coordinatesLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 10),
            coordinatesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
