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
            NumberCardView(value: provider.weather.temperature, label: "Temperature", color: provider.weather.tempIndoorColor)
            NumberCardView(value: provider.weather.humidity, label: "Humidity", color: provider.weather.humidityIndoorColor)
            NumberCardView(value: provider.weather.noise, label: "Noise", color: provider.weather.noiseColor)
            NumberCardView(value: provider.weather.co2, label: "CO2", color: provider.weather.co2IndoorColor)
            WifiView(weather: provider.weather)
        }
        .toolbar(content: toolbarContent)
        .onAppear {
            Task {
                do {
                    try await token.fetchToken()
                } catch let error as TokenError {
                    print(error.localizedDescription)
                } catch {
                    print("Caught an unexpected error: \(error.localizedDescription)")
                }
                do {
                    try await provider.fetchWeather()
                    self.lastUpdated = provider.weather.time.timeIntervalSince1970
                    print(provider.weather.time)
                } catch let error as WeatherError {
                    print(error.localizedDescription)
                } catch {
                    print("Caught an unexpected error: \(error.localizedDescription)")
                }
            }
        }
    }
}

extension Station {
    func fetchWeather() async {
        isLoading = true
        do {
            try await token.fetchToken()
        } catch let error as TokenError {
            print(error.localizedDescription)
        } catch {
            print("Caught an unexpected error: \(error.localizedDescription)")
        }
        do {
            try await provider.fetchWeather()
            self.lastUpdated = provider.weather.time.timeIntervalSince1970
        } catch let error as WeatherError {
            print(error.localizedDescription)
        } catch {
            print("Caught an unexpected error: \(error.localizedDescription)")
        }
        isLoading = false
    }
}

struct Station_Previews: PreviewProvider {
    static var previews: some View {
        Station()
            .environmentObject(WeatherProvider(client: WeatherClient(downloader: TestDownloaderWeather())))
    }
}
