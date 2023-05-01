//
//  TokenProvider.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-26.
//

import Foundation

@MainActor
class TokenProvider: ObservableObject{
    
    private  let client: TokenClient
    
    func fetchToken() async throws {
        let latestToken = try await client.token
        NetatmoCredentials.accessToken = latestToken.accessToken
    }
    
    init(client: TokenClient = TokenClient()) {
        self.client = client
    }
    
}
