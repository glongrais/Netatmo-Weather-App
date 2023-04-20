//
//  TokenModelView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-09.
//

import Foundation
import Alamofire
import SwiftyJSON

class TokenModelView: ObservableObject {
    @Published var accessToken: String = ""
    @Published var expireIn: String = ""
    @Published var refreshToken: String = ""
    
    init(){
        fetchToken()
    }
    
    func fetchToken(){
        let url = "https://api.netatmo.com/oauth2/token"
        let parameters = ["grant_type": "refresh_token", "refesh_token": NetatmoCredentials.refreshToken, "client_id": NetatmoCredentials.clientId, "client_secret": NetatmoCredentials.clientSecret]
        
        AF.request(url, method: .post, parameters: parameters)
            .validate()
            .responseData{ response in
                switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        let accessToken = json["body"]["access_token"].stringValue
                        let expireIn = json["body"]["expire_in"].stringValue
                        let refreshToken = json["body"]["refresh_token"].stringValue
                        DispatchQueue.main.async {
                            self.accessToken = accessToken
                            self.expireIn = expireIn
                            self.refreshToken = refreshToken
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
        
       // NetatmoCredentials.accessToken = self.accessToken
       // NetatmoCredentials.refreshToken = self.refreshToken
        
    }
}
