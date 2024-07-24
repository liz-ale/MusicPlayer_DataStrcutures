import Foundation
import CoreLocation
import MapKit


enum Country: String {
    case unitedKingdom = "United Kingdom"
    case unitedStates = "United States"
    case australia = "Australia"
    case ireland = "Ireland"
    case jamaica = "Jamaica"
}

struct Coordinates {
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    
    var to2D: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
    var to2DString: String {
        return  "latitude: \(latitude). longitude: \(longitude)"
    }
}

struct MapArtistElement {
    let name: String
    let country: Country
    let coordinates: Coordinates
    
    
    static func defaultValues() -> [MapArtistElement] {
        return [
            MapArtistElement(name: "Led Zeppelin", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.5074, longitude: -0.1278)), // London, UK
            MapArtistElement(name: "The Beatles", country: .unitedKingdom, coordinates: Coordinates(latitude: 53.4084, longitude: -2.9916)), // Liverpool, UK
            MapArtistElement(name: "Michael Jackson", country: .unitedStates, coordinates: Coordinates(latitude: 40.7128, longitude: -74.0060)), // Gary, Indiana, USA
            MapArtistElement(name: "Bruce Springsteen", country: .unitedStates, coordinates: Coordinates(latitude: 40.2217, longitude: -74.0037)), // Long Branch, New Jersey, USA
            MapArtistElement(name: "AC/DC", country: .australia, coordinates: Coordinates(latitude: -37.8136, longitude: 144.9631)), // Melbourne, Australia
            MapArtistElement(name: "Pink Floyd", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.5074, longitude: -0.1278)), // London, UK
            MapArtistElement(name: "Queen", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.5074, longitude: -0.1278)), // London, UK
            MapArtistElement(name: "David Bowie", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.5074, longitude: -0.1278)), // London, UK
            MapArtistElement(name: "Elton John", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.5074, longitude: -0.1278)), // London, UK
            MapArtistElement(name: "Bob Dylan", country: .unitedStates, coordinates: Coordinates(latitude: 46.7867, longitude: -92.1005)), // Duluth, Minnesota, USA
            MapArtistElement(name: "The Rolling Stones", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.5074, longitude: -0.1278)), // London, UK
            MapArtistElement(name: "Nirvana", country: .unitedStates, coordinates: Coordinates(latitude: 47.6097, longitude: -122.3331)), // Seattle, Washington, USA
            MapArtistElement(name: "Prince", country: .unitedStates, coordinates: Coordinates(latitude: 44.9778, longitude: -93.2650)), // Minneapolis, Minnesota, USA
            MapArtistElement(name: "U2", country: .ireland, coordinates: Coordinates(latitude: 53.3498, longitude: -6.2603)), // Dublin, Ireland
            MapArtistElement(name: "Radiohead", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.7520, longitude: -1.2577)), // Oxford, UK
            MapArtistElement(name: "Metallica", country: .unitedStates, coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194)), // San Francisco, California, USA
            MapArtistElement(name: "Eagles", country: .unitedStates, coordinates: Coordinates(latitude: 34.0522, longitude: -118.2437)), // Los Angeles, California, USA
            MapArtistElement(name: "Fleetwood Mac", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.5074, longitude: -0.1278)), // London, UK
            MapArtistElement(name: "The Who", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.5074, longitude: -0.1278)), // London, UK
            MapArtistElement(name: "The Clash", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.5074, longitude: -0.1278)), // London, UK
            MapArtistElement(name: "The Doors", country: .unitedStates, coordinates: Coordinates(latitude: 34.0522, longitude: -118.2437)), // Los Angeles, California, USA
            MapArtistElement(name: "Jimi Hendrix", country: .unitedStates, coordinates: Coordinates(latitude: 47.6097, longitude: -122.3331)), // Seattle, Washington, USA
            MapArtistElement(name: "Bob Marley", country: .jamaica, coordinates: Coordinates(latitude: 18.0179, longitude: -76.8099)), // Kingston, Jamaica
            MapArtistElement(name: "Coldplay", country: .unitedKingdom, coordinates: Coordinates(latitude: 51.5074, longitude: -0.1278)), // London, UK
            MapArtistElement(name: "Oasis", country: .unitedKingdom, coordinates: Coordinates(latitude: 53.483959, longitude: -2.244644)), // Manchester, UK
            MapArtistElement(name: "Madonna", country: .unitedStates, coordinates: Coordinates(latitude: 42.3314, longitude: -83.0458)), // Detroit, Michigan, USA
            MapArtistElement(name: "Pearl Jam", country: .unitedStates, coordinates: Coordinates(latitude: 47.6097, longitude: -122.3331)) // Seattle, Washington, USA
        ]

    }
}

