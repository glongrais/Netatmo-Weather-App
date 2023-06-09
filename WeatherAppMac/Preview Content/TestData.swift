//
//  TestData.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-20.
//

import Foundation

let testWeather: Data = """
    {   "module_name": "Indoor",
        "dashboard_data":{
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
        },
        "wifi_status": 55
    }
    """.data(using: .utf8)!

let testWeatherEmpty: Data = """
    {
    }
    """.data(using: .utf8)!

let testWeatherMissingData: Data = """
    {   "module_name": "Indoor",
        "dashboard_data":{
            "time_utc": 1555677739,
            "Temperature": 23.7,
            "min_temp": 21.2,
            "max_temp": 27.4,
            "date_min_temp": 1555631374,
            "date_max_temp": 1555662436,
            "temp_trend": "up"
        }
    }
    """.data(using: .utf8)!

let testNetatmoStationData: Data = """
    {
        "body":{
            "devices":[
                    {
                    "_id":"70:ee:50:22:a3:00",
                    "date_setup":1435834348,
                    "last_setup":1435834348,
                    "type":"NAMain",
                    "last_status_store":1555677748,
                    "module_name":"Indoor",
                    "firmware":137,
                    "last_upgrade":1512405614,
                    "wifi_status":55,
                    "reachable":true,
                    "co2_calibrating":false,
                    "station_name":"Casa",
                    "data_type":["string"],
                    "place":{
                        "timezone":"Africa/Lagos",
                        "country":"EG",
                        "altitude":144,
                        "location":[30.89600807058707, 29.94281464724796]
                    },
                    "read_only":true,
                    "home_id":"594xxxxxxxxxdb",
                    "home_name":"Home",
                    "dashboard_data":{
                        "time_utc":1555677739,
                        "Temperature":23.7,
                        "CO2":967,
                        "Humidity":41,
                        "Noise":42,
                        "Pressure":997.6,
                        "AbsolutePressure":1017.4,
                        "min_temp":21.2,
                        "max_temp":27.4,
                        "date_min_temp":1555631374,
                        "date_max_temp":1555662436,
                        "temp_trend":"up",
                        "pressure_trend":"up"
                    },
                    "modules":[
                            {
                            "oneOf":[
                                    {
                                    "_id":"06:00:00:02:47:00",
                                    "type":"NAModule4",
                                    "module_name":"Indoor Module",
                                    "data_type":["Temperature", "Humidity", "CO2"],
                                    "last_setup":1435834348,
                                    "reachable":true,
                                    "dashboard_data":{
                                        "time_utc":1555677739,
                                        "Temperature":23.7,
                                        "CO2":967,
                                        "Humidity":41,
                                        "Pressure":997.6,
                                        "AbsolutePressure":1017.4,
                                        "min_temp":21.2,
                                        "max_temp":27.4,
                                        "date_min_temp":1555631374,
                                        "date_max_temp":1555662436,
                                        "temp_trend":"up"
                                    },
                                    "firmware":19,
                                    "last_message":1555677746,
                                    "last_seen":1555677746,
                                    "rf_status":31,
                                    "battery_vp":5148,
                                    "battery_percent":58
                                },
                                    {
                                    "_id":"06:00:00:02:47:00",
                                    "type":"NAModule1",
                                    "module_name":"Outdoor Module",
                                    "data_type":["Temperature", "Humidity"],
                                    "last_setup":1435834348,
                                    "reachable":true,
                                    "dashboard_data":{
                                        "time_utc":1555677739,
                                        "Temperature":23.7,
                                        "Humidity":41,
                                        "min_temp":21.2,
                                        "max_temp":27.4,
                                        "date_min_temp":1555631374,
                                        "date_max_temp":1555662436,
                                        "temp_trend":"up"
                                    },
                                    "firmware":19,
                                    "last_message":1555677746,
                                    "last_seen":1555677746,
                                    "rf_status":31,
                                    "battery_vp":5148,
                                    "battery_percent":58
                                },
                                    {
                                    "_id":"06:00:00:02:47:00",
                                    "type":"NAModule3",
                                    "module_name":"Rain gauge",
                                    "data_type":["Rain"],
                                    "last_setup":1435834348,
                                    "reachable":true,
                                    "dashboard_data":{
                                        "time_utc":1555677734,
                                        "Rain":0,
                                        "sum_rain_24":0,
                                        "sum_rain_1":0
                                    },
                                    "firmware":19,
                                    "last_message":1555677746,
                                    "last_seen":1555677746,
                                    "rf_status":31,
                                    "battery_vp":5148,
                                    "battery_percent":58
                                },
                                    {
                                    "_id":"06:00:00:02:47:00",
                                    "type":"NAModule2",
                                    "module_name":"Wind Module",
                                    "data_type":["Wind"],
                                    "last_setup":1435834348,
                                    "battery_percent":58,
                                    "reachable":true,
                                    "firmware":19,
                                    "last_message":1555677746,
                                    "last_seen":1555677746,
                                    "rf_status":31,
                                    "battery_vp":5148,
                                    "dashboard_data":{
                                        "time_utc":1555677734,
                                        "WindStrength":2,
                                        "WindAngle":75,
                                        "GustStrength":3,
                                        "GustAngle":75,
                                        "max_wind_str":4,
                                        "max_wind_angle":100,
                                        "date_max_wind_str":1555673190
                                    }
                                }
                            ]
                        }
                    ]
                }
            ],
            "user":{
                "mail":"name@mail.com",
                "administrative":{
                    "reg_locale":"fr-FR",
                    "lang":"fr-FR",
                    "country":"FR",
                    "unit":0,
                    "windunit":0,
                    "pressureunit":0,
                    "feel_like_algo":0
                }
            }
        },
        "status":"ok",
        "time_exec":"0.060059070587158",
        "time_server":"1553777827"
    }
    """.data(using: .utf8)!

let testToken: Data = """
    {
        "access_token": "token1",
        "expires_in": 1,
        "refresh_token": "refresh1"
    }
    """.data(using: .utf8)!

let testTokenEmpty: Data = """
    {
    }
    """.data(using: .utf8)!

let testTokenMissingData: Data = """
    {
        "access_token": "token1",
        "refresh_token": "refresh1"
    }
    """.data(using: .utf8)!
