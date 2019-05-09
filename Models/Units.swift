//
//  Units.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import Foundation

enum Units: CaseIterable {
    
    case si, ca, uk2, us
    
    public var longName: String {
        switch self {
        case .ca: return "\(self.temperature.symbol), \(self.distance.symbol), \(self.rainfall.symbol)"
        case .si: return "\(self.temperature.symbol), \(self.distance.symbol), \(self.rainfall.symbol)"
        case .uk2: return "\(self.temperature.symbol), \(self.distance.symbol), \(self.rainfall.symbol)"
        case .us: return "\(self.temperature.symbol), \(self.distance.symbol), \(self.rainfall.symbol)"
        }
    }
    
    public var distance: UnitsOfMeasurement {
        switch self {
        case .ca: return UnitsOfMeasurement.kilometers
        case .si: return UnitsOfMeasurement.kilometers
        case .uk2: return UnitsOfMeasurement.miles
        case .us: return UnitsOfMeasurement.miles
        }
    }

    public var pressure: UnitsOfMeasurement {
        switch self {
        case .ca: return UnitsOfMeasurement.hectopascals
        case .si: return UnitsOfMeasurement.hectopascals
        case .uk2: return UnitsOfMeasurement.hectopascals
        case .us: return UnitsOfMeasurement.hectopascals
        }
    }
    
    public var wind: UnitsOfMeasurement {
        switch self {
        case .ca: return UnitsOfMeasurement.kilometersPerHour
        case .si: return UnitsOfMeasurement.metersPerSecond
        case .uk2: return UnitsOfMeasurement.milesPerHour
        case .us: return UnitsOfMeasurement.milesPerHour
        }
    }
    
    public var rainfall: UnitsOfMeasurement {
        switch self {
        case .ca: return UnitsOfMeasurement.milimetersPerHour
        case .si: return UnitsOfMeasurement.milimetersPerHour
        case .uk2: return UnitsOfMeasurement.milimetersPerHour
        case .us: return UnitsOfMeasurement.inchesPerHour
        }
    }
    
    public var temperature: UnitsOfMeasurement {
        switch self {
        case .ca: return UnitsOfMeasurement.celcius
        case .si: return UnitsOfMeasurement.celcius
        case .uk2: return UnitsOfMeasurement.celcius
        case .us: return UnitsOfMeasurement.farenheit
        }
    }
}


enum UnitsOfMeasurement {
    
    case kilometers, hectopascals, milimetersPerHour, celcius, kilometersPerHour, metersPerSecond, miles, milesPerHour, inchesPerHour, farenheit
    
    public var longName: String {
        switch self {
        case .kilometers : return "kilometers"
        case .hectopascals : return "hectopascals"
        case .milimetersPerHour : return "milimeters per hour"
        case .celcius : return "celcius"
        case .kilometersPerHour : return "kilometers per hour"
        case .metersPerSecond : return "meters per second"
        case .miles : return "miles"
        case .milesPerHour : return "miles per hour"
        case .inchesPerHour : return "inches per hour"
        case .farenheit : return "farenheit"
        }
    }
    
    public var symbol: String {
        switch self {
        case .kilometers : return "km"
        case .hectopascals : return "hPa"
        case .milimetersPerHour : return "mm/h"
        case .celcius : return "°C"
        case .kilometersPerHour : return "km/h"
        case .metersPerSecond : return "m/s"
        case .miles : return "mi"
        case .milesPerHour : return "mph"
        case .inchesPerHour : return "in/h"
        case .farenheit : return "°F"
        }
    }
    
}

