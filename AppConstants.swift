//
//  AppConstants.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

class AppConstants {
    
    static let shared = AppConstants()
    
    var language : Language = .english
    var units : Units = .si
    var colour : Colours = .light
    
    struct ExternalUrls {
        static let facebook = "https://www.facebook.com"
        static let twitter = "https://www.twitter.com"
        static let instagram = "https://www.instagram.com"
        static let nappWebsite = "https://www.napp.co"
        static let nappPrivacy = "https://www.napp.co"
        static let appStore = "https://www.apple.com"
    }
    
    struct InternalUrls {
        static let settings = UIApplication.openSettingsURLString
        static let email = "mailto:weather@napp.co"
    }

}

class ForecastDataPoints {
    
    static let shared = ForecastDataPoints()
    
    var  Current = [ForecastData.Temperature.actualTemperature.rawValue,
                    ForecastData.Currently.precipProbability.rawValue,
                    ForecastData.Currently.humidity.rawValue,
                    ForecastData.Currently.wind.rawValue,
                    ForecastData.Currently.pressure.rawValue]
    
    var Hourly = [ForecastData.Hourly.apparentTemperature.rawValue,
                  ForecastData.Hourly.precipProbability.rawValue,
                  ForecastData.Hourly.humidity.rawValue,
                  ForecastData.Hourly.wind.rawValue,
                  ForecastData.Hourly.pressure.rawValue,
                  ForecastData.Hourly.cloudCover.rawValue,
                  ForecastData.Hourly.uvIndex.rawValue,
                  ForecastData.Hourly.dewPoint.rawValue]

    var Daily = [ForecastData.Daily.apparentTemperatureMaxMin.rawValue,
                 ForecastData.Daily.precipProbability.rawValue,
                 ForecastData.Daily.humidity.rawValue,
                 ForecastData.Daily.wind.rawValue,
                 ForecastData.Daily.pressure.rawValue,
                 ForecastData.Daily.cloudCover.rawValue,
                 ForecastData.Daily.moonPhase.rawValue,
                 ForecastData.Daily.sunriseSunsetTime.rawValue]
    
}
