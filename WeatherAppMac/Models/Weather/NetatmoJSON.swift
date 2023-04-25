//
//  NetatmoJSON.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-24.
//

import Foundation

struct NetatmoJSON: Decodable{
    
    private enum RootCodingKeys: String, CodingKey {
        case body
    }
    
    private enum BodyCodingKeys: String, CodingKey {
        case devices
    }
    
    private enum DeviceCodingKeys: String, CodingKey {
        case dashboard = "dashboard_data"
    }
    
    private(set) var weather: Weather = Weather.empty
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let bodyContainer = try rootContainer.nestedContainer(keyedBy: BodyCodingKeys.self, forKey: .body)
        var devicesContainer = try bodyContainer.nestedUnkeyedContainer(forKey: .devices)
        
        //TODO: Handle multiple devices. Now only fetch data for the last device
        while !devicesContainer.isAtEnd {
            let dashboardContainer = try devicesContainer.nestedContainer(keyedBy: DeviceCodingKeys.self)
            
            if let dashboard = try? dashboardContainer.decode(Weather.self, forKey: .dashboard) {
                self.weather = dashboard
            }
        }
    }
}
