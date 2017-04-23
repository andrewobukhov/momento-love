//
//  UsersTableViewController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 04/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchUsers()
    }
    
    func fetchUsers(){
        UserService.instance.fetchUsers(completion: { (user) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserService.instance.users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell

        let user = UserService.instance.users[indexPath.row]

        cell.nameLbl.text = user.name
        
        if let url = user.photos.last {
            cell.profileImg.sd_setImage(with: URL(string: url))
        }

        return cell
    }
}
