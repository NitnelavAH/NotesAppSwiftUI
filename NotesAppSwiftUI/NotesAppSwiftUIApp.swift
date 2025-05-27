//
//  NotesAppSwiftUIApp.swift
//  NotesAppSwiftUI
//
//  Created by Developer on 26/05/25.
//

import SwiftUI

@main
struct NotesAppSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
