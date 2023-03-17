//
//  CLPlacemark.swift
//  MusicByLocation
//
//  Created by Luke Vereker on 02/03/2023.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    func getLocationBreakdown() -> String {
        return
            """
            Street: \(self.thoroughfare ?? "None")
            City: \(self.locality ?? "None")
            Area: \(self.administrativeArea ?? "None")
            Country: \(self.country ?? "None")
            """
    }
}

extension String: Identifiable { public var id: String { self } }
