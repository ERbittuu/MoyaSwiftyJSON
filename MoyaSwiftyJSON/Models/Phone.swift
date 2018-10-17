//
//  Phone.swift
//  MoyaSwiftyJSON
//
//  Created by Utsav Patel on 10/17/18.
//  Copyright © 2018 erbittuu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Phone {

    var mobile: String!
    var home: String!
    var office: String!

	init(fromJson json: JSON!) {
		if json.isEmpty {
			return
		}
        mobile = json["mobile"].stringValue
        home = json["home"].stringValue
        office = json["office"].stringValue
	}

	func toDictionary() -> [String: Any] {
        var dictionary = [String: Any]()
        if mobile != nil {
        	dictionary["mobile"] = mobile
        }
        if home != nil {
        	dictionary["home"] = home
        }
        if office != nil {
        	dictionary["office"] = office
        }
		return dictionary
	}
}
