//
//  NumberCardView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-05.
//

import SwiftUI

struct NumberCardView<T: LosslessStringConvertible>: View {
    var value: T
    var label: String = ""
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
                .frame(width: 80, height: 60)
            VStack{
                Text(label)
                    .foregroundColor(.black)
                Text(String(value)) // Convert value to a String
                    .foregroundColor(.black)
            }
        }
    }
}

struct NumberCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NumberCardView(value: 10, label: "Temperature (Int)")
            NumberCardView(value: 10.5, label: "Temperature (Double)")
        }
    }
}
