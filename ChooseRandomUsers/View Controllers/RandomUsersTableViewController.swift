//
//  RandomUsersTableViewController.swift
//  ChooseRandomUsers
//
//  Created by Jordan Fraughton on 7/18/24.
//

import UIKit

class RandomUsersTableViewController: UITableViewController {
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
