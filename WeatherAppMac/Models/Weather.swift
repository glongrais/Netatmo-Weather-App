//
//  Weather.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-20.
//

import Foundation

struct Weather {
    let temperature: Double
    let humidity: Int
    let co2: Int
    let noise: Int
    let minTemp: Double
    let maxTemp: Double
    let dateMinTemp: Date
    let dateMaxTemp: Date
    let tempTrend: String
}

extension Weather: Decodable {
    private enum CodingKeys: String, CodingKey {
        case temperature = "Temperature"
        case humidity = "Humidity"
        case co2 = "CO2"
        case noise = "Noise"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case dateMinTemp = "date_min_temp"
        case dateMaxTemp = "date_max_temp"
        case tempTrend = "temp_trend"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawTemperature = try? values.decode(Double.self, forKey: .temperature)
        let rawHumidity = try? values.decode(Int.self, forKey: .humidity)
        let rawCo2 = try? values.decode(Int.self, forKey: .co2)
        let rawNoise = try? values.decode(Int.self, forKey: .noise)
        let rawMinTemp = try? values.decode(Double.self, forKey: .minTemp)
        let rawMaxTemp = try? values.decode(Double.self, forKey: .maxTemp)
        let rawDateMinTemp = try? values.decode(Date.self, forKey: .dateMinTemp)
        let rawDateMaxTemp = try? values.decode(Date.self, forKey: .dateMaxTemp)
        let rawTempTrend = try? values.decode(String.self, forKey: .tempTrend)
        
        guard let temperature = rawTemperature,
              let humidity = rawHumidity,
              let co2 = rawCo2,
              let noise = rawNoise,
              let minTemp = rawMinTemp,
              let maxTemp = rawMaxTemp,
              let dateMinTemp = rawDateMinTemp,
              let dateMaxTemp = rawDateMaxTemp,
              let tempTrend = rawTempTrend
        else {
            throw WeatherError.missingData
        }
        
        self.temperature = temperature
        self.humidity = humidity
        self.co2 = co2
        self.noise = noise
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.dateMinTemp = dateMinTemp
        self.dateMaxTemp = dateMaxTemp
        self.tempTrend = tempTrend
        
    }
}

