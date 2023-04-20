//
//  WeatherError.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-20.
//

import Foundation

enum WeatherError: Error{
    case missingData
}

extension WeatherError: LocalizedError{
    var errorDescription: String?{
    case .missingData:
        return NSLocalizedString("Discarding a weather missing a valid data.", comment: "")
    }
}
