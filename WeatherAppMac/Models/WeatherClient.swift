//
//  WeatherClient.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-21.
//

import Foundation

actor WeatherClient {
    private let feedURL = URL(string: "https://api.netatmo.com/api/getstationsdata")!
    private var request: URLRequest
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()
    
    private let downloader: any HTTPDataDownloader
    
    var weather: Weather {
        get async throws {
            let data = try await downloader.httpData(for: request)
            let rawWeather = try decoder.decode(NetatmoJSON.self, from: data)
            var weather = rawWeather.weather
            
            //TODO: Add caching feature
            
            return weather
        }
    }
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
        self.request = URLRequest(url: feedURL)
        self.request.httpMethod = "GET"
        self.request.allHTTPHeaderFields = [
            "access_token": NetatmoCredentials.accessToken,
            "device_id": NetatmoCredentials.deviceId
        ]
        
    }
}
