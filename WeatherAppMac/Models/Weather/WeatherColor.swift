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

extension Weather{
    var tempIndoorColor: Color{
        switch temperature{
        case 0..<16.0:
            return .blue
        case 16.0..<20.0:
            return .cyan
        case 20.0..<24.0:
            return .green
        case 24.0..<27.0:
            return .orange
        case 27.0...:
            return .red
        default:
            return .black
        }
    }
}

extension Weather{
    var humidityIndoorColor: Color{
        switch humidity{
        case 0..<20:
            return .red
        case 20..<30:
            return .orange
        case 30..<70:
            return .green
        case 70..<80:
            return .orange
        case 80..<101:
            return .red
        default:
            return .black
        }
    }
}

extension Weather{
    var noiseColor: Color{
        switch noise{
        case 0..<35:
            return .green
        case 35..<40:
            return .yellow
        case 40..<60:
            return .orange
        case 60..<70:
            return .red
        case 70...:
            return .purple
        default:
            return .black
        }
    }
}

extension Weather{
    var co2IndoorColor: Color{
        switch co2{
        case 0..<1001:
            return .green
        case 1001..<1500:
            return .yellow
        case 1500..<2000:
            return .orange
        case 2000..<Int.max:
            return .red
        default:
            return .black
        }
    }
}
