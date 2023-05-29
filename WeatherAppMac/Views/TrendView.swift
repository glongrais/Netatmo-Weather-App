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
            Image(systemName: "arrowtriangle.up.fill").foregroundColor(.green)
                .bold()
        }else if(trend == "down"){
            Image(systemName: "arrowtriangle.down.fill").foregroundColor(.red)
                .bold()
        }else{
            Image(systemName: "arrowtriangle.right.fill").foregroundColor(.black)
                .bold()
        }
    }
}

struct TrendView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TrendView(trend: "up")
            TrendView(trend: "down")
            TrendView(trend: "stable")
        }
    }
}
