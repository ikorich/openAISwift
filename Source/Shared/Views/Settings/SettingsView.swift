//
//  SettingsView.swift
//  openAISwift
//
//  Created by vitalii on 08.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    
    var body: some View {
        
        TabView {
            VStack {
                TextField("Access", text: $viewModel.accessToken)
                    .textFieldStyle(BaseTextFieldStyle())
                    .frame(minWidth: 256)
                Spacer()
            }
            .padding()
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
            
            VStack {
                Toggle("Enable test data", isOn: $viewModel.isTestMode)
                Spacer()
            }
            .padding()
            .tabItem {
                Image(systemName: "ladybug")
                Text("Debug")
            }
        }
        .padding(.init(top: 32, leading: 16, bottom: 0, trailing: 16))
        .presentationDetents([.fraction(0.32)])
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingsViewModel(settings: AppSettings()))
    }
}
