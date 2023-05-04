//
//  WeatherWifiColor.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-04.
//

import SwiftUI

extension Weather{
    var wifiColor: Color{
        switch temperature{
        case 1:
            return .green
        case 2:
            return .orange
        case 3:
            return .red
        default:
            return .black
        }
    }
}
