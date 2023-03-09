//
//  ToolBarModifier.swift
//  openAISwift
//
//  Created by vitalii on 09.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI

#if os(tvOS)

struct ToolBarModifier: ViewModifier {
    @ObservedObject var viewModel: ContentViewModel
    
    func body(content: Content) -> some View {
        content
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
            .padding(32)
    }
}

#endif
