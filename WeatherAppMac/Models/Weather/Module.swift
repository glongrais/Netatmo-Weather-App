//
//  Module.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-04.
//

import Foundation

struct Module {
    let time: Date
    let temperature: Double
    let humidity: Int
    let co2: Int
    let noise: Int
    let minTemp: Double
    let maxTemp: Double
    let dateMinTemp: Date
    let dateMaxTemp: Date
    let tempTrend: String
}
