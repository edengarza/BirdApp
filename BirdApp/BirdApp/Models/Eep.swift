//
//  eep.swift
//  BirdApp
//
//  Created by Edén Garza on 1/29/22.
//

import Foundation
import SwiftUI

struct Eep: Hashable, Codable, Identifiable {
    var id: Int
    var username: String
    var content: String
    
    var userAvi: Image {
        Image(username)
    }
}
