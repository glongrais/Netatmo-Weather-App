//
//  TokenClientTests.swift
//  WeatherAppMacTests
//
//  Created by Guillaume Longrais on 2023-05-09.
//

import XCTest
@testable import WeatherAppMac

final class TokenClientTests: XCTestCase {
    
    var sut: TokenClient!
    var testDownloader: TestDownloaderToken!
    
    override func setUp() {
        super.setUp()
        testDownloader = TestDownloaderToken()
        sut = TokenClient(downloader: testDownloader)
    }
    
    override func tearDown() {
        sut = nil
        testDownloader = nil
        super.tearDown()
    }
    
    func testFetchToken_Success() async throws {
        testDownloader.data = testToken
        // Make sure testDownloader returns valid token data
        let token = try await sut.token
        XCTAssertNotNil(token)
        // Assert the token properties as required
    }
    
    func testFetchToken_InvalidURL() async throws {
        // Update TestDownloaderToken to throw WeatherError.networkError
        testDownloader.error = WeatherError.networkError
        
        do {
            let _ = try await sut.token
            XCTFail("Expected WeatherError.networkError to be thrown")
        } catch {
            XCTAssertEqual(error as? WeatherError, WeatherError.networkError)
        }
    }
}

