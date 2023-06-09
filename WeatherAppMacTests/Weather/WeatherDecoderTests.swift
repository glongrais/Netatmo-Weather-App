//
//  WeatherAppMacTests.swift
//  WeatherAppMacTests
//
//  Created by Guillaume Longrais on 2023-04-06.
//

import XCTest
@testable import WeatherAppMac

final class WeatherDecoderTests: XCTestCase {

    func testNetatmoDecoderDecodesWeather() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let weather = try decoder.decode(Weather.self, from: testWeather)
        
        XCTAssertEqual(weather.temperature, 23.7)
        
        let expectedSeconds = TimeInterval(1_555_677_739)
        let decodedSeconds = weather.time.timeIntervalSince1970

        XCTAssertEqual(expectedSeconds, decodedSeconds, accuracy: 0.000_01)
        
    }
    
    func testNetatmoDecoderDecodesWeatherEmpty() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        XCTAssertThrowsError(try decoder.decode(Weather.self, from: testWeatherEmpty)){
            error in
            XCTAssertEqual(error as! WeatherError, WeatherError.missingData)
        }
    }
    
    func testNetatmoDecoderDecodesWeatherMissingData() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        XCTAssertThrowsError(try decoder.decode(Weather.self, from: testWeatherMissingData)){
            error in
            XCTAssertEqual(error as! WeatherError, WeatherError.missingData)
        }
    }

}
