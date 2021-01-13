//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Omri Horowitz on 1/11/21.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
 
    //MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
        
              
              
    //MARK: - PROPERTIES
       var entry: Entry?
    var journal: Journal?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        titleTextField.delegate = self
        
    }
    @IBAction func clearBodyText(_ sender: Any) {
        
        titleTextField.text = " "
        bodyTextView.text = " "
    }

//MARK: - ACTION

    @IBAction func saveBarButtonTapped(_ sender: Any) {

    guard let title = titleTextField.text, !title.isEmpty,
      let body = bodyTextView.text, !body.isEmpty,
        let journal = journal else { return }
        
        EntryController.createEntryWith(newEntryTitle: title, newEntryBody: body, journal: journal)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        JournalController.shared.saveToPersistenceStore()
    }

    //MARK: - FUNCTIONS
    func updateView() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //delegate method
          textField.resignFirstResponder()
            return true
        }
}// END CLASS

