//
//  NetatmoJSON.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-24.
//

import Foundation

struct WeatherJSON: Decodable{
    
    private enum RootCodingKeys: String, CodingKey {
        case body
    }
    
    private enum BodyCodingKeys: String, CodingKey {
        case devices
    }
    
    private(set) var weather: Weather = Weather.empty
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let bodyContainer = try rootContainer.nestedContainer(keyedBy: BodyCodingKeys.self, forKey: .body)
        var devicesContainer = try bodyContainer.nestedUnkeyedContainer(forKey: .devices)
        
        //TODO: Handle multiple devices. Now only fetch data for the last device
        while !devicesContainer.isAtEnd {
            do {
                let device = try devicesContainer.decode(Weather.self)
                self.weather = device
            } catch WeatherError.missingData {
                // Rethrow the error
                throw WeatherError.missingData
            } catch {
                // Catch other errors and rethrow them
                throw error
            }
        }
    }
}
