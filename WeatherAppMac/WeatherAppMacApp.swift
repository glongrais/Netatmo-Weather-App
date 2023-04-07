//
//  WeatherAppMacApp.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-06.
//

import SwiftUI

@main
struct WeatherAppMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WeatherViewModel())
        }
    }
}
