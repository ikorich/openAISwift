//
//  ToolBarModifier.swift
//  openAISwift
//
//  Created by vitalii on 09.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI

#if canImport(AppKit)

struct ToolBarModifier: ViewModifier {
    @ObservedObject var viewModel: ContentViewModel
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {   // << here !!
            Rectangle()
                .navigationBarItems(leading: HStack(content: {
                    Button(action: viewModel.displaySettings, label: viewModel.makeSettingsButtonLabel)
                        .sheet(isPresented: $viewModel.isSettingsViewDisplays) {
                            //onExit
                        } content: {
                            SettingsView(viewModel: viewModel.settingsViewModel)
                                .navigationBarItems(trailing: viewModel.makeDismissSettingsViewButton())
                        }
                }), trailing: HStack(content: {
                    Button(action: viewModel.addItem, label: viewModel.makeAddItemButtonLabel)
                }))
                .padding(8)
            Divider()
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button(action: toggleSidebar, label: {
                            Image(systemName: "sidebar.leading")
                        })
                    }
                }
            content
        }
    }
    
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

#endif
