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
    var body: some View {
        HStack{
            NumberCardView(value: provider.weather.temperature, label: "Temperature", color: provider.weather.tempIndoorColor)
            NumberCardView(value: provider.weather.humidity, label: "Humidity", color: provider.weather.humidityIndoorColor)
            NumberCardView(value: provider.weather.noise, label: "Noise", color: provider.weather.noiseColor)
            NumberCardView(value: provider.weather.co2, label: "CO2", color: provider.weather.co2IndoorColor)
            WifiView(weather: provider.weather)
        }
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
                } catch let error as WeatherError {
                    print(error.localizedDescription)
                } catch {
                    print("Caught an unexpected error: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct Station_Previews: PreviewProvider {
    static var previews: some View {
        Station()
            .environmentObject(WeatherProvider(client: WeatherClient(downloader: TestDownloaderWeather())))
    }
}
