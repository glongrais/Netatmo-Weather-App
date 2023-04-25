//
//  TokenError.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-25.
//

import Foundation

enum TokenError: Error{
    case missingData
    case networkError
}

extension TokenError: LocalizedError{
    var errorDescription: String?{
        switch self{
        case .missingData:
            return NSLocalizedString("Discarding a token missing a valid data.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching token data over the network.", comment: "")
        }
    }
}
