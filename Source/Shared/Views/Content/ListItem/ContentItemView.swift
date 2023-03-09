//
//  ContentItemView.swift
//  openAISwift
//
//  Created by vitalii on 09.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI

struct ContentItemView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    @ViewBuilder
    var body: some View {
        HStack {
            content
            Spacer()
        }
            .font(.title2)
            .padding(20)
            .background(.gray)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct ContentItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentItemView {
            Text("Test")
        }
    }
}
