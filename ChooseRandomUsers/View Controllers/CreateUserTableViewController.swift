//
//  CreateUserTableViewController.swift
//  ChooseRandomUsers
//
//  Created by Jordan Fraughton on 7/18/24.
//

import UIKit

class CreateUserTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateSaveButtonState()
    }
    
    // MARK: - Helper Functions
    
    func updateSaveButtonState() {
        let shouldEnableSaveButton = nameTextField?.text?.isEmpty == false
        saveButton.isEnabled = shouldEnableSaveButton
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let name = nameTextField.text! // save button only enabled if not nil
        
        user = User(name: name)
    }
    
    // MARK: - Delegates
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
}
