//
//  BaseTextFieldStyle.swift
//  openAISwift
//
//  Created by vitalii on 09.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI

struct BaseTextFieldStyle: TextFieldStyle {
    /// Whether the user is focused on this `TextField`.
    var isEditing: Bool = false
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .textFieldStyle(PlainTextFieldStyle())
            .multilineTextAlignment(.leading)
            .font(.headline)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(border)
    }
    
    var border: some View {
        RoundedRectangle(cornerRadius: 16)
            .strokeBorder(
                Color.accentColor,
                lineWidth: isEditing ? 4 : 2
            )
    }
}
