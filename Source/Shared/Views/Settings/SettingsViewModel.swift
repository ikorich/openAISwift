//
//  SettingsViewModel.swift
//  openAISwift
//
//  Created by vitalii on 08.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import Combine
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var accessToken: String = ""
    @Published var isTestMode: Bool = false
    
    private var settings: AppSettingsProtocol
    
    private var subscribers = Set<AnyCancellable>()
    
    init(settings: AppSettingsProtocol) {
        self.settings = settings
        
        accessToken = settings.accessToken
        $accessToken
            .scan(settings.accessToken) { [weak self] latest, current in
                self?.settings.accessToken = current
                return current
            }
            .sink(receiveValue: { _ in })
            .store(in: &subscribers)
        
        isTestMode = settings.isTestMode
        $isTestMode
            .scan(settings.isTestMode) { [weak self] latest, current in
                self?.settings.isTestMode = current
                return current
            }
            .sink(receiveValue: { _ in })
            .store(in: &subscribers)
    }
}
