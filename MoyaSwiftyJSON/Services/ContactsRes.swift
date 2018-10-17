//
//  ContactsRes.swift
//  MoyaSwiftyJSON
//
//  Created by Utsav Patel on 10/17/18.
//  Copyright © 2018 erbittuu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ContactsRes {

    var contacts: [Contact] = []

    static let null  = ContactsRes(fromJson: JSON())

	init(fromJson json: JSON!) {
		if json.isEmpty {
			return
		}
        contacts = [Contact]()
        let contactsArray = json["contacts"].arrayValue
        for contactsJson in contactsArray {
            let value = Contact(fromJson: contactsJson)
            contacts.append(value)
        }
	}

	func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        var dictionaryElements = [[String: Any]]()
        for contactsElement in contacts {
        	dictionaryElements.append(contactsElement.toDictionary())
        }
        dictionary["contacts"] = dictionaryElements

		return dictionary
	}
}
