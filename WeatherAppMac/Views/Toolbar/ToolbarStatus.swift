//
//  ToolbarStatus.swift
//  WeatherAppMac
//
//  Created by Guillaume Longrais on 2023-05-07.
//

import SwiftUI

struct ToolbarStatus: View {
    var isLoading: Bool
    var lastUpdated: TimeInterval

    var body: some View {
        VStack {
            if isLoading {
                Text("Checking for updates...")
            } else {
                let lastUpdatedDate = Date(timeIntervalSince1970: lastUpdated)
                Text("Updated \(lastUpdatedDate.formatted(.relative(presentation: .named)))")
            }
        }
        .font(.caption)
    }
}

struct ToolbarStatus_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarStatus(
            isLoading: true,
            lastUpdated: Date.distantPast.timeIntervalSince1970
        )
        .previewLayout(.fixed(width: 200, height: 40))

        ToolbarStatus(
            isLoading: false,
            lastUpdated: Date.now.timeIntervalSince1970
        )
        .previewLayout(.fixed(width: 200, height: 40))

        ToolbarStatus(
            isLoading: false,
            lastUpdated: Date.distantPast.timeIntervalSince1970
        )
        .previewLayout(.fixed(width: 200, height: 40))

    }
}
