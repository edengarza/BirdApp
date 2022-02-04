//
//  Notification.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import Foundation
import SwiftUI

struct Notification: Hashable, Codable, Identifiable {
    var id: Int
    var type: String
    var icon: String
    var username: String
    var eepId: Int
    
    var iconImage: Image {
        Image(systemName: icon)
    }
}

func pastTenseType(type: String) -> String {
    switch type {
    case "follow":
        return "\(type)ed"
    default:
        return "\(type)d"
    }
}
