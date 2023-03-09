//
//  Application.swift
//  anotherOneApp
//
//  Created by vitalii on 03.03.2023.
//

import SwiftUI

@main
struct Application: App {
    private let viewModel: ContentViewModel = ContentViewModel(viewContext: PersistenceController.shared.container.viewContext, settings: AppSettings())
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
#if !os(tvOS)
        .commands {
            SidebarCommands()
        }
#endif
    }
}
