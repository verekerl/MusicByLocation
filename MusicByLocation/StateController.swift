//
//  StateController.swift
//  MusicByLocation
//
//  Created by Luke Vereker on 02/03/2023.
//

import Foundation

class StateController: ObservableObject {
    let locationHandler: LocationHandler = LocationHandler()
    let iTunesAdaptor = ITunesAdaptor()
    @Published var artistsByLocation: [String] = [""]
    
    var lastKnownLocation: String = "" {
        didSet {
            iTunesAdaptor.getArtists(target: lastKnownLocation,  completion: updateArtitsByLocation)
        }
    }
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    
    func requestAccessToLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuthorisation()
    }
    
    func updateArtitsByLocation(artists: [Artist]?) {
        let names  =  artists?.map { return $0.name }
        DispatchQueue.main.async {
            self.artistsByLocation = names ?? ["Error finding artists from your location"]
        }
    }
}
