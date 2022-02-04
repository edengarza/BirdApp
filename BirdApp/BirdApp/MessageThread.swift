//
//  DirectMessage.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import Foundation

struct MessageThread: Identifiable, Codable {
    var id: Int
    var username: String
    var message: String
}
