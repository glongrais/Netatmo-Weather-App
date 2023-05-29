//
//  BatteryView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-02.
//

import SwiftUI

struct BatteryView: View {
    var color: Color
    
    var body: some View {
        if(color == .green){
            Image(systemName: "battery.100").foregroundColor(color)
        }else if(color == .yellow){
            Image(systemName: "battery.75").foregroundColor(color)
        }else if(color == .orange){
            Image(systemName: "battery.50").foregroundColor(color)
        }else if(color == .red){
            Image(systemName: "battery.25").foregroundColor(color)
        }else{
            Image(systemName: "battery.0").foregroundColor(.red)
        }
    }
}

struct BatteryView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            BatteryView(color: .green)
            BatteryView(color: .yellow)
            BatteryView(color: .orange)
            BatteryView(color: .red)
            BatteryView(color: .black)
        }
    }
}
