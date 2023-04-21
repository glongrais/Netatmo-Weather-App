//
//  WeatherClient.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-21.
//

import Foundation

actor WeatherClient {
    private let feedURL = URL(string: "https://api.netatmo.com/api/getstationsdata")
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()
    
    private let downloader: any HTTPDataDownloader
    
    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
}
