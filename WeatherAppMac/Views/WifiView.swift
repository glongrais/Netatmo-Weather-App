//
//  WifiView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-02.
//

import SwiftUI

struct WifiView: View {
    var color: Color
    
    var body: some View {
        Image(systemName: "wifi").foregroundColor(color)
    }
}

struct WifiView_Previews: PreviewProvider {
    static var previews: some View {
        WifiView(color: .red)
    }
}
