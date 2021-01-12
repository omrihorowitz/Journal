//
//  SongController.swift
//  Playlist
//
//  Created by Omri Horowitz on 1/11/21.
//

import Foundation

class EntryController {
    
    // Shared Instance
    static let shared = EntryController()
    
    // Source of Truth (SOT)
    var entries: [Entry] = []
    
    
    // CRUD Methods
    // Create
    func createEntryWith(newEntryTitle: String, newEntryBody: String) {
        let newEntry = Entry(title: newEntryTitle, body: newEntryBody, timestamp: 0.00)
        entries.append(newEntry)
        
saveToPersistenceStore()
    }
    
    // TODO: - Update
    
    // Delete
    func delete(entryToDelete: Entry) {
        guard let index = entries.firstIndex(of: entryToDelete) else { return }
        entries.remove(at: index)
       saveToPersistenceStore()
    }
    
    //MARK: - Persistence
    
    // file URL
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Journal.json")
        return fileURL
    }
    
    // save
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: fileURL())
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }

    // load
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: fileURL())
            let foundEntries = try JSONDecoder().decode([Entry].self, from: data)
            entries = foundEntries
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
}

