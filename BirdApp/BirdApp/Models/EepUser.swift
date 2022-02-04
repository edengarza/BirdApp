//
//  User.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import Foundation
import SwiftUI

struct EepUser: Codable, Identifiable {
    var id: Int
    var username: String
    var handle: String
    
    var profilePicture: Image {
        Image(username)
    }
}
