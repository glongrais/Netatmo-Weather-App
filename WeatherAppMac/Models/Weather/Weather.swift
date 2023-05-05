//
//  Weather.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-20.
//

import Foundation

struct Weather {
    let moduleName: String
    let time: Date
    let temperature: Double
    let humidity: Int
    let co2: Int
    let noise: Int
    let minTemp: Double
    let maxTemp: Double
    let dateMinTemp: Date
    let dateMaxTemp: Date
    let tempTrend: String
    let wifiStatus: Int
}

extension Weather: Decodable {
    private enum CodingKeys: String, CodingKey {
        case moduleName = "module_name"
        case wifiStatus = "wifi_status"
        case dashboardData = "dashboard_data"
    }
    
    private enum DashboardDataCodingKeys: String, CodingKey {
        case time = "time_utc"
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
        let rawModuleName = try? values.decode(String.self, forKey: .moduleName)
        let rawWifiStatus = try? values.decode(Int.self, forKey: .wifiStatus)
        let dashboardData = try? values.nestedContainer(keyedBy: DashboardDataCodingKeys.self, forKey: .dashboardData)
        
        let rawTime = try? dashboardData?.decode(Date.self, forKey: .time)
        let rawTemperature = try? dashboardData?.decode(Double.self, forKey: .temperature)
        let rawHumidity = try? dashboardData?.decode(Int.self, forKey: .humidity)
        let rawCo2 = try? dashboardData?.decode(Int.self, forKey: .co2)
        let rawNoise = try? dashboardData?.decode(Int.self, forKey: .noise)
        let rawMinTemp = try? dashboardData?.decode(Double.self, forKey: .minTemp)
        let rawMaxTemp = try? dashboardData?.decode(Double.self, forKey: .maxTemp)
        let rawDateMinTemp = try? dashboardData?.decode(Date.self, forKey: .dateMinTemp)
        let rawDateMaxTemp = try? dashboardData?.decode(Date.self, forKey: .dateMaxTemp)
        let rawTempTrend = try? dashboardData?.decode(String.self, forKey: .tempTrend)
        
        guard let time = rawTime,
              let temperature = rawTemperature,
              let humidity = rawHumidity,
              let co2 = rawCo2,
              let noise = rawNoise,
              let minTemp = rawMinTemp,
              let maxTemp = rawMaxTemp,
              let dateMinTemp = rawDateMinTemp,
              let dateMaxTemp = rawDateMaxTemp,
              let tempTrend = rawTempTrend,
              let moduleName = rawModuleName,
              let wifiStatus = rawWifiStatus
        else {
            throw WeatherError.missingData
        }
        
        self.time = time
        self.temperature = temperature
        self.humidity = humidity
        self.co2 = co2
        self.noise = noise
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.dateMinTemp = dateMinTemp
        self.dateMaxTemp = dateMaxTemp
        self.tempTrend = tempTrend
        self.moduleName = moduleName
        self.wifiStatus = wifiStatus
        
    }
}

extension Weather{
    static var empty: Weather {
        let weather = Weather(moduleName: "Indoor",
                              time: Date.now,
                              temperature: 0.0,
                              humidity: 0,
                              co2: 0,
                              noise: 0,
                              minTemp: 0,
                              maxTemp: 0,
                              dateMinTemp: Date.now,
                              dateMaxTemp: Date.now,
                              tempTrend: "",
                              wifiStatus: 55)
        return weather
    }
}
