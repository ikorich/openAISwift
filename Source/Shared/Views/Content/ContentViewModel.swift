//
//  ContentViewModel.swift
//  openAISwift
//
//  Created by vitalii on 08.03.2023.
//  Copyright © 2023 IGR Soft. All rights reserved.
//

import SwiftUI
import CoreData

class ContentViewModel: ObservableObject {
    @Published var items: [Item] = []
    
    private var viewContext: NSManagedObjectContext
    
    @State var settings: AppSettingsProtocol
    
    @Published var isSettingsViewDisplays: Bool
    func displaySettings() {
        isSettingsViewDisplays = true
    }
    
    func hideSettings() {
        isSettingsViewDisplays = false
    }
    
    init(viewContext: NSManagedObjectContext, settings: AppSettingsProtocol, isSettingsViewDisplays: Bool = false) {
        self.settings = settings
        self.isSettingsViewDisplays = isSettingsViewDisplays
        self.viewContext = viewContext
        
        fetchItems()
    }
    
    func addItem() {
        let newItem = Item(context: viewContext)
        newItem.timestamp = Date()
        
        do {
            try viewContext.save()
            fetchItems()
        } catch {
            print("Error adding item: \(error)")
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        offsets.map { items[$0] }.forEach(viewContext.delete)
        
        do {
            try viewContext.save()
            fetchItems()
        } catch {
            print("Error deleting item: \(error)")
        }
    }
    
    private func fetchItems() {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)]
        
        do {
            items = try viewContext.fetch(fetchRequest)
        } catch {
            print("Error fetching items: \(error)")
        }
    }
    
    lazy private(set) var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    var settingsViewModel: SettingsViewModel {
        SettingsViewModel(settings: settings)
    }
    
    @ViewBuilder func makeSettingsButtonLabel() -> some View {
        Image(systemName: "gear")
    }
    
    @ViewBuilder func makeAddItemButtonLabel() -> some View {
        Label("Add Item", systemImage: "plus")
    }
    
    @ViewBuilder func makeDismissSettingsViewButton() -> some View {
        Button("Dismiss", action: hideSettings)
            .padding(.init(top: 0, leading: 0, bottom: 16, trailing: 16))
    }
    
    @ViewBuilder func listItemCell(for item: Item) -> some View {
        Text(item.timestamp!, formatter: formatter) 
    }
}
