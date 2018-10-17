//
//  ContactListController.swift
//  MoyaSwiftyJSON
//
//  Created by Utsav Patel on 10/17/18.
//  Copyright © 2018 erbittuu. All rights reserved.
//

import UIKit
import SwiftyJSON

class ContactListController: UIViewController {

    var dataSource = ContactsRes.null

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchContacts()
    }

    func fetchContacts() {
        contactService.request(.contactsList) { result in
            switch result {
            case let .success(moyaResponse):
                let statusCode = moyaResponse.statusCode
                print(statusCode)
                let json = JSON(moyaResponse.data)
                self.dataSource = ContactsRes(fromJson: json)
                self.refresh()
            case let .failure(error):
                print(error)
            }
        }
    }

    func refresh() {
        tableView.reloadData()
    }
}

extension ContactListController: UITableViewDelegate {

}

extension ContactListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell {
            let contact = dataSource.contacts[indexPath.row]
           cell.contact = contact
            return cell
        }
        return UITableViewCell()
    }

}
