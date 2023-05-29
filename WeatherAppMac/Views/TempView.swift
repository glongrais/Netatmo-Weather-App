//
//  TempView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-29.
//

import SwiftUI

struct TempView<T: LosslessStringConvertible>: View {
    var value: T
    var label: String
    var color: Color = .black
    var trend: String
    var body: some View {
        VStack {
            Text(label)
                .foregroundColor(.black)
            HStack{
                TrendView(trend: trend)
                Text(String(value))
                    .foregroundColor(color)
                    .bold()
            }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
        )
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TempView(value: 10, label: "Temperature (Int)", color: .blue, trend: "up")
            TempView(value: 17.5, label: "Temperature (Double)", color: .cyan, trend: "down")
        }
    }
}
