//
//  NumberCardView.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-05.
//

import SwiftUI

struct NumberCardView<T: LosslessStringConvertible>: View {
    var value: T
    var label: String
    var color: Color = .black
    var body: some View {
        VStack {
            Text(label)
                .foregroundColor(.black)
            Text(String(value))
                .foregroundColor(color)
                .bold()
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
        )
    }
}

struct NumberCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NumberCardView(value: 10, label: "Temperature (Int)", color: .blue)
            NumberCardView(value: 17.5, label: "Temperature (Double)", color: .cyan)
        }
    }
}
