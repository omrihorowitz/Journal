//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Omri Horowitz on 1/11/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    //MARK: - Outlets and Actions
    
    
    
    
    //MARK: - Properties
    var journal: Journal?
    
    
//MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journal?.entries.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        guard let entry = journal?.entries[indexPath.row] else { return cell}
        
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.timestamp.dateToString()

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let journal = journal else { return }
            let entryToDelete = journal.entries[indexPath.row]
            EntryController.deleteEntry(entry: entryToDelete, journal: journal)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
           guard let destination = segue.destination as? EntryDetailViewController,
                 let journal = journal else { return }
           if segue.identifier == "toDetailVC" {
               guard let indexPath = tableView.indexPathForSelectedRow else { return }
               let entryToSend = journal.entries[indexPath.row]
               destination.journal = journal
               destination.entry = entryToSend
           } else if segue.identifier == "createNewEntry" {
            destination.journal = journal
           }
       }
}

