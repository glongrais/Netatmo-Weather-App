# Netatmo-Weather-App  

This Mac app displays weather information about the Netatmo weather station you have at home. The app uses the Netatmo API to fetch the data.

<p align="center">
    <img src="https://img.shields.io/badge/license-MIT-green" alt="License: MIT">
</p>

## Requirements

- MacOS 13 or later
- A Netatmo Weather Station
- A Netatmo account and API key

## Credentials

To set up credentials for your Netatmo weather station, follow these steps:

1. Visit the [Netatmo Developer website](https://dev.netatmo.com) and log in with the account you registered your weather station.

2. Go to **My apps** to find your `clientId` and `clientSecret`.

3. Use the **Token generator** in the same section to generate your `accessToken` and `refreshToken`.

4. Navigate to **My Account** > **Settings** > **Manage my home** to find your weather station's `deviceId` (MAC address).

5. Rename the file `NetatmoCredentials.swift.txt` to `NetatmoCredentials.swift`.

6. Replace the placeholders in `NetatmoCredentials.swift` with your credentials:

```swift
struct NetatmoCredentials {
    static var accessToken = "YOUR_ACCESS_TOKEN"
    static let refreshToken = "YOUR_REFRESH_TOKEN"
    static let clientId = "YOUR_CLIENT_ID"
    static let clientSecret = "YOUR_CLIENT_SECRET"
    static let deviceId = "YOUR_DEVICE_ID"
}
```


## Development

This app was developed only for learning purposes and is not an official Netatmo app. It was created as a personal project to explore the use of the Netatmo API and macOS development.

## Ressources

[Getting started with Earthquakes](https://developer.apple.com/tutorials/app-dev-training/getting-started-with-earthquakes), official Apple tutorial.   
[Netatmo API](https://dev.netatmo.com/apidocumentation/weather)

## Contributing

We welcome contributions to this project. If you would like to contribute, please fork the repository and submit a pull request.

## License

This app is released under the MIT License. See [LICENSE](https://github.com/glongrais/Netatmo-Weather-App/blob/main/README.md) for details.
