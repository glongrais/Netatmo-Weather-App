//
//  TokenClient.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-26.
//

import Foundation

actor TokenClient {
    private var request: URLRequest
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        return aDecoder
    }()
    
    private let downloader: any HTTPDataDownloader
    
    var token: Token {
        get async throws {
            let data = try await downloader.httpData(for: request)
            let rawToken = try decoder.decode(TokenJSON.self, from: data)
            var token = rawToken.token
            
            //TODO: Add caching feature
            
            return token
        }
    }
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
        
        let url = URL(string: "https://api.netatmo.com/oauth2/token")!

        self.request = URLRequest(url: url)
        self.request.httpMethod = "POST"
        self.request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let requestBodyComponents: [String: String] = [
            "grant_type": "refresh_token",
            "client_id": NetatmoCredentials.clientId,
            "client_secret": NetatmoCredentials.clientSecret,
            "refresh_token": NetatmoCredentials.refreshToken
        ]

        let requestBodyString = requestBodyComponents
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")

        self.request.httpBody = requestBodyString.data(using: .utf8)

        
    }
}
