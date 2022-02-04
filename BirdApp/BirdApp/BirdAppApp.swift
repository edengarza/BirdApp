//
//  BirdAppApp.swift
//  BirdApp
//
//  Created by Edén Garza on 1/29/22.
//

import SwiftUI

@main
struct BirdAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
