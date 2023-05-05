//
//  WeatherWifiColor.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-04.
//

import SwiftUI

extension Weather{
    var wifiColor: Color{
        switch wifiStatus{
        case 0..<57:
            return .green
        case 57..<72:
            return .orange
        case 72..<Int.max:
            return .red
        default:
            return .black
        }
    }
}
