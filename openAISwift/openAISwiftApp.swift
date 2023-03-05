//
//  openAISwiftApp.swift
//  openAISwift
//
//  Created by vitalii on 03.03.2023.
//

import SwiftUI

@main
struct openAISwiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
