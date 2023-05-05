//
//  WifiView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-02.
//

import SwiftUI

struct WifiView: View {
    var weather: Weather
    
    var body: some View {
        Image(systemName: "wifi").foregroundColor(weather.wifiColor)
    }
}

struct WifiView_Previews: PreviewProvider {
    static var previewWeather = Weather.empty
    static var previews: some View {
        WifiView(weather: previewWeather)
    }
}
