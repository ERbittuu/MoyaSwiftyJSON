//
//  Contact.swift
//  MoyaSwiftyJSON
//
//  Created by Utsav Patel on 10/17/18.
//  Copyright © 2018 erbittuu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Contact {

    var id: String!
    var name: String!
    var email: String!
    var address: String!
    var gender: String!
    var phone: Phone!

	init(fromJson json: JSON!) {
		if json.isEmpty {
			return
		}
        id = json["id"].stringValue
        name = json["name"].stringValue
        email = json["email"].stringValue
        address = json["address"].stringValue
        gender = json["gender"].stringValue
        let phoneJson = json["phone"]
        if !phoneJson.isEmpty {
            phone = Phone(fromJson: phoneJson)
        }
	}

	func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        if id != nil {
        	dictionary["id"] = id
        }
        if name != nil {
        	dictionary["name"] = name
        }
        if email != nil {
        	dictionary["email"] = email
        }
        if address != nil {
        	dictionary["address"] = address
        }
        if gender != nil {
        	dictionary["gender"] = gender
        }
        if phone != nil {
        	dictionary["phone"] = phone.toDictionary()
        }
		return dictionary
	}
}
