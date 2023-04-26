//
//  TokenJSON.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-25.
//

import Foundation

struct TokenJSON: Decodable {
    private enum RootCodingKeys: String, CodingKey {
        case body
    }
    
    private(set) var token: Token = Token.empty
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        if let body = try? rootContainer.decode(Token.self, forKey: .body) {
            self.token = body
        }
    }
}
