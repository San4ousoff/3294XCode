//
//  HW6App.swift
//  HW6
//
//  Created by Mac on 19.12.2023.
//

import SwiftUI

@main
struct HW6App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
