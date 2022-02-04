//
//  ModelData.swift
//  BirdApp
//
//  Created by Edén Garza on 1/29/22.
//

import Foundation
import SwiftUI

var eeps: [Eep] = load("eepsData.json")
var messageThreads: [DirectMessage] = load("dmsData.json")
var eepUsers: [EepUser] = load("userData.json")
var notifications: [Notification] = load("notifData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find filename \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func getUser(_ username: String) -> EepUser {
    let users = eepUsers
    var result: EepUser?
    
    for user in users {
        if (user.username == username) {
            result = user
            break
        }
    }
    
    return result!
}

func getThread(_ username: String) -> DirectMessage {
    let threads = messageThreads
    var result: DirectMessage?
    
    for thread in threads {
        if (thread.senderUsername == username) {
            result = thread
            break
        }
    }
    
    return result!
}

func getEep(_ eepId: Int) -> Eep {
    let eeps = eeps
    var result: Eep?
    
    for eep in eeps {
        if (eep.id == eepId) {
            result = eep
            break
        }
    }
    
    return result!
}
