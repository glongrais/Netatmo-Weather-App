//
//  Station.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-24.
//

import SwiftUI

struct Station: View {
    @EnvironmentObject var provider: WeatherProvider
    @EnvironmentObject var token: TokenProvider
    
    @State var isLoading = false
    
    @AppStorage("lastUpdated")
    var lastUpdated = Date.distantFuture.timeIntervalSince1970
    
    var body: some View {
        HStack{
            TempView(value: provider.weather.temperature, label: "Temperature", color: provider.weather.tempIndoorColor, trend: provider.weather.tempTrend)
            NumberCardView(value: provider.weather.humidity, label: "Humidity", color: provider.weather.humidityIndoorColor)
            NumberCardView(value: provider.weather.noise, label: "Noise", color: provider.weather.noiseColor)
            NumberCardView(value: provider.weather.co2, label: "CO2", color: provider.weather.co2IndoorColor)
            WifiView(weather: provider.weather)
        }
        .toolbar(content: toolbarContent)
        .onAppear {
            Task {
                await fetchWeather()
            }
        }
    }
}

extension Station {
    func fetchWeather() async {
        isLoading = true
        do {
            try await token.fetchToken()
            try await provider.fetchWeather()
            self.lastUpdated = provider.weather.time.timeIntervalSince1970
        } catch {
            handleError(error)
        }
        isLoading = false
    }
    
    func handleError(_ error: Error) {
        if let error = error as? TokenError {
            print(error.localizedDescription)
        } else if let error = error as? WeatherError {
            print(error.localizedDescription)
        } else {
            print("Caught an unexpected error: \(error.localizedDescription)")
        }
    }
}

struct Station_Previews: PreviewProvider {
    static var previews: some View {
        Station()
            .environmentObject(WeatherProvider(client: WeatherClient(downloader: TestDownloaderWeather())))
    }
}
