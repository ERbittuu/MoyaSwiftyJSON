//
//  ContactService.swift
//  MoyaSwiftyJSON
//
//  Created by Utsav Patel on 10/17/18.
//  Copyright © 2018 erbittuu. All rights reserved.
//

import Foundation
import Moya

// MARK: - Provider support
let contactService = MoyaProvider<ContactService>(plugins: [NetworkLoggerPlugin(verbose: true)])

enum ContactService {
    case contactsList
}

extension ContactService: TargetType {
    var path: String {
        switch self {
            case .contactsList:
                return "contacts/"
        }

    }

    var method: Moya.Method {
        switch self {
            case .contactsList:
                return .get
        }
    }

    var task: Task {
        switch self {
            case .contactsList:
                return Task.requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var baseURL: URL {
        return App.serverURL
    }

    var sampleData: Data {
        return Data()
    }

    var validationType: ValidationType {
        return .successCodes
    }
}
