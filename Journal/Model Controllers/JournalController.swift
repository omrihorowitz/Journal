//
//  JournalController.swift
//  Journal
//
//  Created by Omri Horowitz on 1/12/21.
//

import Foundation

class JournalController {
    
//MARK: - SHARED INSTANCE
    static let shared = JournalController()
    
//MARK: - SOURCE OF TRUTH
    var journals: [Journal] = []
    
//MARK: - Create Journal
    func createJournalWith(title: String) {
        let newJournal = Journal(title: title)
        journals.append(newJournal)
        saveToPersistenceStore()
    }
    
//MARK: - Delete Journal
     func deleteJournalWith(journal: Journal) {
        guard let index = journals.firstIndex(of: journal) else { return }
        journals.remove(at: index)
        saveToPersistenceStore()
    }
    
     func addEntryTo(journal: Journal, entry: Entry) {
        journal.entries.append(entry)
        saveToPersistenceStore()
    }
    
     func removeEntryFrom(journal: Journal, entry: Entry) {
        guard let index = journal.entries.firstIndex(of: entry) else { return }
        journal.entries.remove(at: index)
        saveToPersistenceStore()
    }
    

//MARK: - Persistence

// file URL
func fileURL() -> URL {
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let fileURL = urls[0].appendingPathComponent("Journal.json")
    return fileURL
}

// save
func saveToPersistenceStore() {
    do {
        let data = try JSONEncoder().encode(journals)
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
        let foundJournals = try JSONDecoder().decode([Journal].self, from: data)
        journals = foundJournals
    } catch {
        print(error)
        print(error.localizedDescription)
        }
    }
}
