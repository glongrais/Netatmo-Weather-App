//
//  Station.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-24.
//

import SwiftUI

struct Station: View {
    @EnvironmentObject var provider: WeatherProvider
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(.white)
            .frame(width: 80, height: 60)
            .overlay{
                Text("CO2: \(provider.weather.co2)")}
            .task {
                do{
                    try await provider.fetchWeather()}
                catch let error as WeatherError {
                    print(error.localizedDescription)
                } catch {
                    print("Caught an unexpected error: \(error.localizedDescription)")
                }
            }
    }
}

struct Station_Previews: PreviewProvider {
    static var previews: some View {
        Station()
            .environmentObject(WeatherProvider(client: WeatherClient(downloader: TestDownloader())))
    }
}
