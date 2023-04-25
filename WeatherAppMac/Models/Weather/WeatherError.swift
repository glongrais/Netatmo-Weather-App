//
//  WeatherError.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-20.
//

import Foundation

enum WeatherError: Error{
    case missingData
    case networkError
}

extension WeatherError: LocalizedError{
    var errorDescription: String?{
        switch self{
        case .missingData:
            return NSLocalizedString("Discarding a weather missing a valid data.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching weather data over the network.", comment: "")
        }
    }
}
