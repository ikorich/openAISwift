//
//  ItemsList.swift
//  openAISwift
//
//  Created by vitalii on 09.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI

struct ItemsList<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    @ViewBuilder
    var body: some View {
        content
#if !os(tvOS)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
#endif
    }
}

struct ItemsList_Previews: PreviewProvider {
    static var previews: some View {
        ItemsList {
            Text("Test")
        }
    }
}
