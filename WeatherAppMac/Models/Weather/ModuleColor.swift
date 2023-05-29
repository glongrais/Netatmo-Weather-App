//
//  ModuleColor.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-29.
//

import SwiftUI

extension Module{
    var rfColor: Color{
        switch rfStatus{
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
    
    var batteryColor: Color{
        switch batteryPercent{
        case 0..<11:
            return .black
        case 11..<36:
            return .red
        case 36..<51:
            return .orange
        case 51..<75:
            return .yellow
        case 75..<101:
            return .green
        default:
            return .black
        }
    }
    
    var tempOutdoorColor: Color{
        switch temperature{
        case 0..<16.0:
            return .blue
        case 16.0..<20.0:
            return .cyan
        case 20.0..<24.0:
            return .green
        case 24.0..<29.0:
            return .orange
        case 29.0...:
            return .red
        default:
            return .black
        }
    }

    var humidityOutdoorColor: Color{
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
