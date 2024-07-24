//
//  MapViewController.swift
//  MusicPlayer_DataStructures
//
//  Created by julian.garcia on 24/07/24.
//

import UIKit
import MapKit
import Combine

class MapViewController: UIViewController {
    private var viewModel = MapViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.mapType = .mutedStandard
        return map
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        setMapConstraints()
        setupBindings()
    }
    
    
    private func setMapConstraints() {
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func setupBindings() {
        viewModel.$mapElementArtists
            .receive(on: DispatchQueue.main)
            .sink {[weak self] mapArtistElements in
                mapArtistElements.forEach { self?.createAnnotation(with: $0) }
            }
            .store(in: &cancellables)
        
        viewModel.$selectedArtist
            .receive(on: DispatchQueue.main)
            .sink { selectedArtist in
                guard let selectedArtist = selectedArtist else { return }
                
                let viewController = MapDetailViewController(artist: selectedArtist)
                
                if let sheetController = viewController.sheetPresentationController {
                    sheetController.detents = [.medium()]
                }
                
                self.present(viewController, animated: true)
            }
            .store(in: &cancellables)
    }
    
    private func createAnnotation(with artist: MapArtistElement) {
        let annotations = MKPointAnnotation()
        annotations.title = artist.name
        annotations.coordinate = artist.coordinates.to2D
        mapView.addAnnotation(annotations)
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation, let title = annotation.title else { return }
        
        viewModel.didSelectArtistWith(title: title!)
        
    }
}
