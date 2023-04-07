//
//  WeatherModelView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-06.
//

import Foundation
import Alamofire
import SwiftyJSON
//import NetatmoCredentials

class WeatherViewModel: ObservableObject {
    @Published var temperature: String = ""
    @Published var humidity: String = ""
    @Published var co2: String = ""
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let url = "https://api.netatmo.com/api/getstationsdata"
        let parameters = ["access_token": NetatmoCredentials.accessToken, "device_id": NetatmoCredentials.deviceId]
        AF.request(url, parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let temperatureValue = json["body"]["devices"][0]["dashboard_data"]["Temperature"].stringValue
                    let humidityValue = json["body"]["devices"][0]["dashboard_data"]["Humidity"].stringValue
                    let co2Value = json["body"]["devices"][0]["dashboard_data"]["CO2"].stringValue
                    DispatchQueue.main.async {
                        self.temperature = temperatureValue
                        self.humidity = humidityValue
                        self.co2 = co2Value
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
