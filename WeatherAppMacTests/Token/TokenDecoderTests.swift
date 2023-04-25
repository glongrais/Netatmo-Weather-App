//
//  TokenDecoderTests.swift
//  WeatherAppMacTests
//
//  Created by Guillaume Longrais on 2023-04-25.
//

import XCTest
@testable import WeatherAppMac

final class TokenDecoderTests: XCTestCase {

    func testDecoderDecodesToken() throws {
        let decoder = JSONDecoder()
        let token = try decoder.decode(Token.self, from: testToken)
        
        XCTAssertEqual(token.accessToken, "token1")
        
    }
    
    func testDecoderDecodesTokenEmpty() throws {
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(Token.self, from: testTokenEmpty)){
            error in
            XCTAssertEqual(error as! TokenError, TokenError.missingData)
        }
    }
    
    func testDecoderDecodesTokenMissingData() throws {
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(Token.self, from: testTokenMissingData)){
            error in
            XCTAssertEqual(error as! TokenError, TokenError.missingData)
        }
    }

}
