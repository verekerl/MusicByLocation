//
//  Artist.swift
//  MusicByLocation
//
//  Created by Luke Vereker on 02/03/2023.
//

import Foundation

struct Artist: Codable {
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "artistName"
    }
}
