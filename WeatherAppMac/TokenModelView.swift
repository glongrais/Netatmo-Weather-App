//
//  TokenModelView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-04-09.
//

import Foundation

class TokenModelView: ObservableObject {
    @Published var access_token: String = ""
    @Published var expire_in: String = ""
    @Published var refresh_token: String = ""
    
    init(){
        fetchToken()
    }
    
    func fetchToken(){
        
    }
}
