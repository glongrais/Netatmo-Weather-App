//
//  TrendView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-29.
//

import SwiftUI

struct TrendView: View {
    var trend: String
    var body: some View {
        if(trend == "up"){
            Image(systemName: "arrow.up.forward").foregroundColor(.green)
                .bold()
        }else{
            Image(systemName: "arrow.down.forward").foregroundColor(.red)
                .bold()
        }
    }
}

struct TrendView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TrendView(trend: "up")
            TrendView(trend: "down")
        }
    }
}
