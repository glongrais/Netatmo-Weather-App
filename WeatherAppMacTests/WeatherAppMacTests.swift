//
//  WeatherAppMacTests.swift
//  WeatherAppMacTests
//
//  Created by Guillaume Longrais on 2023-04-06.
//

import XCTest
@testable import WeatherAppMac

final class WeatherAppMacTests: XCTestCase {

    func testNetatmoDecoderDecodesWeather() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let weather = try decoder.decode(Weather.self, from: testWeather)
        
        XCTAssertEqual(weather.temperature, 23.7)
        
        let expectedSeconds = TimeInterval(1_555_677_739) / 1000
        let decodedSeconds = weather.time.timeIntervalSince1970

        XCTAssertEqual(expectedSeconds, decodedSeconds, accuracy: 0.000_01)
        
    }

}
