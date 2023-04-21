//
//  TestData.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-20.
//

import Foundation

let testWeather: Data = """
    {
        "time_utc": 1555677739,
        "Temperature": 23.7,
        "CO2": 967,
        "Humidity": 41,
        "Noise": 42,
        "Pressure": 997.6,
        "AbsolutePressure": 1017.4,
        "min_temp": 21.2,
        "max_temp": 27.4,
        "date_min_temp": 1555631374,
        "date_max_temp": 1555662436,
        "temp_trend": "up"
    }
    """.data(using: .utf8)!

let testWeatherEmpty: Data = """
    {
    }
    """.data(using: .utf8)!

let testWeatherMissingData: Data = """
    {
        "Humidity": 41,
        "Noise": 42,
        "Pressure": 997.6,
        "AbsolutePressure": 1017.4,
        "min_temp": 21.2,
        "max_temp": 27.4,
        "date_min_temp": 1555631374,
        "date_max_temp": 1555662436,
        "temp_trend": "up"
    }
    """.data(using: .utf8)!
