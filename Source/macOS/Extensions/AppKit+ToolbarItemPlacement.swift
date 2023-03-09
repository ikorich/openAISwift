//
//  View+Layout.swift
//  anotherOneApp
//
//  Created by vitalii on 08.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI

#if canImport(AppKit)

extension ToolbarItemPlacement {
    public static let navigationBarTrailing: ToolbarItemPlacement = .automatic
}

extension View {
    
    @ViewBuilder
    public func navigationBarItems<L, T>(leading: L, trailing: T) -> some View where L : View, T : View {
        HStack {
            leading
            Spacer()
            trailing
        }
    }
}

#endif



