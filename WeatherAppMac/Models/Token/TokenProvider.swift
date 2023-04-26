//
//  TokenProvider.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-26.
//

import Foundation

@MainActor
class TokenProvider: ObservableObject{
    
    @Published var token: Token = Token.empty
    
    private  let client: TokenClient
    
    func fetchToken() async throws {
        let latestToken = try await client.token
        self.token = latestToken
    }
    
    init(client: TokenClient = TokenClient()) {
        self.client = client
    }
    
}
