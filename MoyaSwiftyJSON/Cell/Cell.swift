//
//  Cell.swift
//  MoyaSwiftyJSON
//
//  Created by Utsav Patel on 10/17/18.
//  Copyright © 2018 erbittuu. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    var contact: Contact? {
        didSet {
            self.textLabel?.text = contact?.name
            self.detailTextLabel?.text = contact?.email
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
