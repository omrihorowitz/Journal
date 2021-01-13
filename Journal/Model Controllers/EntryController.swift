//
//  SongController.swift
//  Playlist
//
//  Created by Omri Horowitz on 1/11/21.
//

import Foundation

class EntryController {
    
    // CRUD Methods
    // Create
    static func createEntryWith(newEntryTitle: String, newEntryBody: String, newTimeStamp: Date = Date(), journal: Journal) {
        let newEntry = Entry(title: newEntryTitle, body: newEntryBody)
        JournalController.shared.addEntryTo(journal: journal, entry: newEntry)
    }
    
    // TODO: - Update
    static func update(entry: Entry, title: String, body: String) {
          entry.title = title
          entry.body = body
          JournalController.shared.saveToPersistenceStore()
      }
    
    
    // Delete
    static func deleteEntry(entry: Entry, journal: Journal) {
        JournalController.shared.removeEntryFrom(journal: journal, entry: entry)
    }
}

