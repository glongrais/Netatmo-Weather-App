//
//  WeatherAppMacClientDecoderTests.swift
//  WeatherAppMacTests
//
//  Created by Guillaume Longrais on 2023-04-24.
//

import XCTest
@testable import WeatherAppMac


final class ClientDecoderTests: XCTestCase {

    func testClientDoesFetchWeatherData() async throws {
        let downloader = TestDownloaderWeather()
        let client = WeatherClient(downloader: downloader)
        let weather = try await client.weather

        XCTAssertEqual(weather.co2, 967)
    }

}
