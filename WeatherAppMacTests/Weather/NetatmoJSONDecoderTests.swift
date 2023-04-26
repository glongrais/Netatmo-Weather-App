//
//  NetatmoJSONDecoderTests.swift
//  WeatherAppMacTests
//
//  Created by Guillaume Longrais on 2023-04-24.
//

import XCTest
@testable import WeatherAppMac

class NetatmoJSONDecoderTests: XCTestCase {
    
    // Helper function to convert milliseconds to Date
    private func dateFromMilliseconds(_ milliseconds: Int64) -> Date {
        return Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    func testNetatmoJSONDecoding() {
        let jsonString = """
        {
            "body": {
                "devices": [
                    {
                        "dashboard_data": {
                            "time_utc": 1674357600000,
                            "Temperature": 20.5,
                            "Humidity": 50,
                            "CO2": 800,
                            "Noise": 45,
                            "min_temp": 18.5,
                            "max_temp": 22.5,
                            "date_min_temp": 1674308400000,
                            "date_max_temp": 1674354000000,
                            "temp_trend": "stable"
                        }
                    }
                ]
            }
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        
        do {
            let netatmoJSON = try decoder.decode(WeatherJSON.self, from: jsonData)
            XCTAssertEqual(netatmoJSON.weather.time, dateFromMilliseconds(1674357600000))
            XCTAssertEqual(netatmoJSON.weather.temperature, 20.5)
            XCTAssertEqual(netatmoJSON.weather.humidity, 50)
            XCTAssertEqual(netatmoJSON.weather.co2, 800)
            XCTAssertEqual(netatmoJSON.weather.noise, 45)
            XCTAssertEqual(netatmoJSON.weather.minTemp, 18.5)
            XCTAssertEqual(netatmoJSON.weather.maxTemp, 22.5)
            XCTAssertEqual(netatmoJSON.weather.dateMinTemp, dateFromMilliseconds(1674308400000))
            XCTAssertEqual(netatmoJSON.weather.dateMaxTemp, dateFromMilliseconds(1674354000000))
            XCTAssertEqual(netatmoJSON.weather.tempTrend, "stable")
        } catch {
            XCTFail("Failed to decode NetatmoJSON: \(error)")
        }
    }

    private func isWeatherEmpty(_ weather: Weather) -> Bool {
        return weather.temperature == 0.0 &&
               weather.humidity == 0 &&
               weather.co2 == 0 &&
               weather.noise == 0 &&
               weather.minTemp == 0 &&
               weather.maxTemp == 0 &&
               weather.tempTrend.isEmpty
    }

    func testNetatmoJSONDecodingWithMissingDashboardData() {
        let jsonString = """
        {
            "body": {
                "devices": [
                    {
                        "some_other_data": "irrelevant"
                    }
                ]
            }
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        do {
            let netatmoJSON = try decoder.decode(WeatherJSON.self, from: jsonData)
            XCTAssertTrue(isWeatherEmpty(netatmoJSON.weather))
        } catch {
            XCTFail("Failed to decode NetatmoJSON: \(error)")
        }
    }
}

