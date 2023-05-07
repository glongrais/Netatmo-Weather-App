//
//  WeatherClient.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-21.
//

import Foundation

actor WeatherClient {
    private var request: URLRequest
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .secondsSince1970
        return aDecoder
    }()
    
    private let downloader: any HTTPDataDownloader
    
    var weather: Weather {
        get async throws {
            self.buildRequest()
            let data = try await downloader.httpData(for: request)
            let rawWeather = try decoder.decode(WeatherJSON.self, from: data)
            var weather = rawWeather.weather
            
            //TODO: Add caching feature
            
            return weather
        }
    }
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
        
        var urlComponents = URLComponents(string: "https://api.netatmo.com/api/getstationsdata")!
        urlComponents.queryItems = [
            URLQueryItem(name: "device_id", value: NetatmoCredentials.deviceId),
        ]

        let url = urlComponents.url!

        self.request = URLRequest(url: url)
        self.request.httpMethod = "GET"
        self.request.addValue("application/json", forHTTPHeaderField: "accept")
        self.request.addValue("Bearer \(NetatmoCredentials.accessToken)", forHTTPHeaderField: "Authorization")
    }
    
    func buildRequest() -> Void {
        var urlComponents = URLComponents(string: "https://api.netatmo.com/api/getstationsdata")!
        urlComponents.queryItems = [
            URLQueryItem(name: "device_id", value: NetatmoCredentials.deviceId),
        ]

        let url = urlComponents.url!

        self.request = URLRequest(url: url)
        self.request.httpMethod = "GET"
        self.request.addValue("application/json", forHTTPHeaderField: "accept")
        self.request.addValue("Bearer \(NetatmoCredentials.accessToken)", forHTTPHeaderField: "Authorization")
    }
}
