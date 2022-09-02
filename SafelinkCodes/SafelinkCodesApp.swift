//
//  SafelinkCodesApp.swift
//  SafelinkCodes
//
//  Created by Augustine Francis on 02/09/2022.
//

import SwiftUI

@main
struct SafelinkCodesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
