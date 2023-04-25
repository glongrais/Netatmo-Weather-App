//
//  Token.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-25.
//

import Foundation

struct Token{
    let accessToken: String
    let expiration: Int
    let refreshToken: String
}

extension Token: Decodable{
    private enum CodingKeys: String, CodingKey{
        case accessToken = "access_token"
        case expiration = "expires_in"
        case refreshToken = "refresh_token"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let accessTokenRaw = try? values.decode(String.self, forKey: .accessToken)
        let expirationRaw = try? values.decode(Int.self, forKey: .expiration)
        let refreshTokenRaw = try? values.decode(String.self, forKey: .refreshToken)
        
        guard let accessToken = accessTokenRaw,
              let expiration = expirationRaw,
              let refreshToken = refreshTokenRaw
        else {
            throw TokenError.missingData
        }
        
        self.accessToken = accessToken
        self.expiration = expiration
        self.refreshToken = refreshToken
    }
}
