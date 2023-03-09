//
//  ContentView.swift
//  anotherOneApp
//
//  Created by vitalii on 03.03.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationView {
            List {
                ItemsList {
                    ForEach(viewModel.items) { item in
                        NavigationLink(destination: ContentDetailsView(item: item)) {
                            ContentItemView {
                                viewModel.listItemCell(for: item)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deleteItems)
                }
            }
            .listStyle(PlainListStyle())
            .modifier(ToolBarModifier(viewModel: viewModel))
            Text("Select an item")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel(viewContext: PersistenceController.shared.container.viewContext, settings: AppSettings()))
    }
}
