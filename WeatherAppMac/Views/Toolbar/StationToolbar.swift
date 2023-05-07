//
//  StationToolbar.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-07.
//

import SwiftUI

extension Station {
    
    @ToolbarContentBuilder
    func toolbarContent() -> some ToolbarContent {
        ToolbarItemGroup(placement: .principal) {
            RefreshButton {
                Task {
                    await fetchWeather()
                }
            }
            Spacer()
            ToolbarStatus(
                isLoading: isLoading,
                lastUpdated: lastUpdated
            )
        }
    }
    
}
