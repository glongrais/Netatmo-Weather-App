//
//  ContentView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-06.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            Text("Current temperature: \(viewModel.temperature)")
            Text("Current humidity: \(viewModel.humidity)")
            Text("Current CO2: \(viewModel.co2)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WeatherViewModel())
    }
}
