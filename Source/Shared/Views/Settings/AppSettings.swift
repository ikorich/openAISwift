//
//  AppSettings.swift
//  openAISwift
//
//  Created by vitalii on 08.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI

protocol AppSettingsProtocol {
    var accessToken: String { get set }
    var isTestMode: Bool { get set }
}

class AppSettings: AppSettingsProtocol, ObservableObject {
    private enum Key {
        static let accessToken = "accessToken"
        static let isTestMode = "isTestMode"
    }
    
    @AppStorage(Key.accessToken) var accessToken: String = ""
    @AppStorage(Key.isTestMode) var isTestMode: Bool = false
}
