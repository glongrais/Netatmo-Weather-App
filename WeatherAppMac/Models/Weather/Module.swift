//
//  Module.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-04.
//

import Foundation

struct Module {
    let time: Date
    let temperature: Double
    let humidity: Int
    let minTemp: Double
    let maxTemp: Double
    let dateMinTemp: Date
    let dateMaxTemp: Date
    let tempTrend: String
    let rfStatus: Int
    let batteryPercent: Int
}

extension Module: Decodable{
    private enum RootKeys: String, CodingKey {
        case oneOf = "oneOf"
    }
    private enum CodingKeys: String, CodingKey {
        case rfStatus = "rf_status"
        case batteryPercent = "battery_percent"
        case dashboardData = "dashboard_data"
    }
    
    private enum DashboardDataCodingKeys: String, CodingKey {
        case time = "time_utc"
        case temperature = "Temperature"
        case humidity = "Humidity"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case dateMinTemp = "date_min_temp"
        case dateMaxTemp = "date_max_temp"
        case tempTrend = "temp_trend"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rawRfStatus = try? values.decode(Int.self, forKey: .rfStatus)
        let rawBatteryPercent = try? values.decode(Int.self, forKey: .batteryPercent)
        let dashboardData = try? values.nestedContainer(keyedBy: DashboardDataCodingKeys.self, forKey: .dashboardData)
        
        let rawTime = try? dashboardData?.decode(Date.self, forKey: .time)
        let rawTemperature = try? dashboardData?.decode(Double.self, forKey: .temperature)
        let rawHumidity = try? dashboardData?.decode(Int.self, forKey: .humidity)
        let rawMinTemp = try? dashboardData?.decode(Double.self, forKey: .minTemp)
        let rawMaxTemp = try? dashboardData?.decode(Double.self, forKey: .maxTemp)
        let rawDateMinTemp = try? dashboardData?.decode(Date.self, forKey: .dateMinTemp)
        let rawDateMaxTemp = try? dashboardData?.decode(Date.self, forKey: .dateMaxTemp)
        let rawTempTrend = try? dashboardData?.decode(String.self, forKey: .tempTrend)
        
        guard let time = rawTime,
              let temperature = rawTemperature,
              let humidity = rawHumidity,
              let minTemp = rawMinTemp,
              let maxTemp = rawMaxTemp,
              let dateMinTemp = rawDateMinTemp,
              let dateMaxTemp = rawDateMaxTemp,
              let tempTrend = rawTempTrend,
              let rfStatus = rawRfStatus,
              let batteryPercent = rawBatteryPercent
        else {
            throw WeatherError.missingData
        }
        
        self.time = time
        self.temperature = temperature
        self.humidity = humidity
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.dateMinTemp = dateMinTemp
        self.dateMaxTemp = dateMaxTemp
        self.tempTrend = tempTrend
        self.rfStatus = rfStatus
        self.batteryPercent = batteryPercent
        
    }
}
