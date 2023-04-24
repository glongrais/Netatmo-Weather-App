//
//  WeatherProvider.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-24.
//

import Foundation

@MainActor
class WeatherProvider: ObservableObject{
    
    @Published var weather: Weather = Weather.empty
    
    private  let client: WeatherClient
    
    func fetchWeather() async throws {
        let latestWeather = try await client.weather
        self.weather = latestWeather
    }
    
    init(client: WeatherClient = WeatherClient()) {
        self.client = client
    }
    
}
