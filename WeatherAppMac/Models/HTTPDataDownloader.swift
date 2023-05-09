/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 A protocol describing an HTTP Data Downloader.
 */

import Foundation

let validStatus = 200...299
/// A protocol describing an HTTP Data Downloader.
protocol HTTPDataDownloader {
    func httpData(for: URLRequest) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    
    func httpData(for request: URLRequest) async throws -> Data {
        do {
                   guard let (data, response) = try await self.data(for: request, delegate: nil) as? (Data, HTTPURLResponse),
                         validStatus.contains(response.statusCode) else {
                       throw WeatherError.networkError
                   }
                   return data
               } catch {
                   if let urlError = error as? URLError, urlError.code == .cannotFindHost {
                       throw WeatherError.networkError
                   }
                   throw error
               }
    }
}
