//
//  DirectMessage.swift
//  BirdApp
//
//  Created by Edén Garza on 1/30/22.
//

import Foundation

struct DirectMessage: Hashable, Codable, Identifiable {
    var id: Int
    var content: String
    var senderUsername: String
    var receiverUsername: String
}
