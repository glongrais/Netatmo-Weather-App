//
//  WeatherAppMacApp.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-06.
//

import SwiftUI

@main
struct WeatherAppMacApp: App {
    @StateObject var weatherProvider = WeatherProvider()
    @StateObject var tokenProvider = TokenProvider()
    var body: some Scene {
        WindowGroup {
            Station()
                .environmentObject(weatherProvider)
                .environmentObject(tokenProvider)
        }
    }
}
