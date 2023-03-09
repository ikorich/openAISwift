//
//  ContentDetailsView.swift
//  openAISwift
//
//  Created by vitalii on 09.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI

struct ContentDetailsView: View {
    @StateObject var item: Item
    
    var body: some View {
        Text(item.description)
    }
}

struct ContentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailsView(item: Item())
    }
}
