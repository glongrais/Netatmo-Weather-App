//
//  TestDownloaderToken.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-26.
//

import Foundation

class TestDownloaderToken: HTTPDataDownloader {
    var data: Data?
    var error: Error?
    
    func httpData(for: URLRequest) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        if let error = error {
            throw error
        }
        return data ?? Data()
    }
    
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        if let error = error {
            throw error
        }
        return data ?? Data()
    }
}
