//
//  UsersTableViewController.swift
//  ChooseRandomUsers
//
//  Created by Jordan Fraughton on 7/18/24.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedUsers = User.loadUsers() {
            users = savedUsers
        } else {
            users = User.loadSampleUsers()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        let user = users[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = user.name
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - Segues
    
    @IBAction func unwindToUserList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        
        let sourceViewController = segue.source as! CreateUserTableViewController
        
        if let user = sourceViewController.user {
            let newIndexPath = IndexPath(row: users.count, section: 0)
            users.append(user)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
        User.saveUsers(users)
    }
}
