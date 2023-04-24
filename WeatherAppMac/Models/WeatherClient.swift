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
            return Weather.init(time: Date(timeIntervalSince1970: 11), temperature: 1.0, humidity: 1, co2: 1, noise: 1, minTemp: 1.0, maxTemp: 1.0, dateMinTemp: Date(timeIntervalSince1970: 11), dateMaxTemp: Date(timeIntervalSince1970: 11), tempTrend: "1")
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
