//
//  DownloaderTests.swift
//  WeatherAppMacTests
//
//  Created by Guillaume Longrais on 2023-05-09.
//

import XCTest
@testable import WeatherAppMac

final class HTTPDataDownloaderTests: XCTestCase {
    
    var sut: URLSession!
    
    override func setUp() {
        super.setUp()
        sut = URLSession(configuration: .ephemeral)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testHttpDataFor_ValidRequest() async throws {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        let request = URLRequest(url: url)
        let data = try await sut.httpData(for: request)
        XCTAssertNotNil(data)
    }
    
    func testHttpDataFor_InvalidRequest() async throws {
        let url = URL(string: "https://nonexistent.example.com")!
        let request = URLRequest(url: url)
        do {
            let _ = try await sut.httpData(for: request)
            XCTFail("Expected WeatherError.networkError to be thrown")
        } catch {
            print("Error caught: \(error)")
            XCTAssertEqual(error as? WeatherError, WeatherError.networkError)
        }
    }
}

