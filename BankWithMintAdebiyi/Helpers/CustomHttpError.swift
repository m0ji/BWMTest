//
//  CustomHttpError.swift
//  BankWithMintAdebiyi
//
//  Created by Mojisola Adebiyi on 12/07/2020.
//  Copyright © 2020 Mojisola Adebiyi. All rights reserved.
//

import Foundation


enum CustomHttpError: String, Error {
    case NotJson
    case BadRequest
    case ServerError
    case bodyError
    case Unknown
}

extension CustomHttpError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .NotJson:
            return "Response not in JSON format"
        case .BadRequest:
            return "BadRequest"
        case .ServerError:
            return "ServerError"
        case .bodyError:
            return "GET requests cannot have a body"
        case .Unknown:
            return "Unknown"
        }
    }
}
