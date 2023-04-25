/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A test class to fake a network connection.
*/

import Foundation

class TestDownloader: HTTPDataDownloader {
    func httpData(for: URLRequest) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        print("ho")
        return testNetatmoStationData
    }
    
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        return testNetatmoStationData
    }
}

