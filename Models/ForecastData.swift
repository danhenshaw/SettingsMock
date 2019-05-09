//
//  ForecastData.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

enum ForecastData {
    
    enum Daily: String, CaseIterable {
        case sunriseSunsetTime = "Sunrise / Sunset"
        case moonPhase = "Moon Phase"
        case precipIntensity = "Precip Intensity"
        case precipIntensityMaxWithTime = "Precip Max with Time"
        case temperatureHighWithTime = "Max Temperature with Time"
        case temperatureLowWithTime = "Min Temperature with Time"
        case precipProbability = "Precip Probability"
        case temperatureMaxMin = "Max/Min Temperature (Actual)"
        case apparentTemperatureMaxMin = "Max/Min Temperature (Feels like)"
        case dewPoint = "Dew Point"
        case humidity = "Humidity"
        case pressure = "Pressure"
        case wind = "Wind Speed and Direction"
        case cloudCover = "Cloud Cover"
        case uvIndex = "UV Index"
        case visibility = "Visibility"
        case ozone = "Ozone"
    }
    
    enum Hourly: String, CaseIterable {
        case precipIntensity = "Precip Intensity"
        case precipProbability = "Precip Probability"
        case temperature = "Temperature (Actual)"
        case apparentTemperature = "Temperature (Feels like)"
        case dewPoint = "Dew Point"
        case humidity = "Humidity"
        case pressure = "Pressure"
        case wind = "Wind Speed and Direction"
        case cloudCover = "Cloud Cover"
        case uvIndex = "UV Index"
        case visibility = "Visibility"
        case ozone = "Ozone"
    }
    
    enum Currently: String, CaseIterable {
        case nearestStorm = "Nearest Storm"
        case precipIntensity = "Precip Intensity"
        case precipProbability = "Precip Probability"
        case temperature = "Temperature (Actual)"
        case apparentTemperature = "Temperature (Feels like)"
        case dewPoint = "Dew Point"
        case humidity = "Humidity"
        case pressure = "Pressure"
        case wind = "Wind Speed and Direction"
        case cloudCover = "Cloud Cover"
        case uvIndex = "UV Index"
        case visibility = "Visibility"
        case ozone = "Ozone"
    }
    
    enum Temperature: String, CaseIterable {
        case actualTemperature = "Actual"
        case apparentTemperature = "Feels like"
    }
}
