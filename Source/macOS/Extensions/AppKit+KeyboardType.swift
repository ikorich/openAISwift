//
//  AppKit+KeyboardType.swift
//  anotherOneApp
//
//  Created by vitalii on 07.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI

#if canImport(AppKit)

public enum KeyboardType : Int, @unchecked Sendable {

    case `default` = 0 // Default type for the current input method.

    case decimalPad = 8 // A number pad with a decimal point.
}

extension View {
    @ViewBuilder
    func keyboardType(_ type: KeyboardType) -> some View {
        self
    }
}

#endif
