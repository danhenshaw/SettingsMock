//
//  PickerViewModel.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

class PickerViewModel {
    
    // MARK: - Properties
    
    var viewType: PickerViewType
    
    
    // MARK: - Initialiser
    
    init(viewType: PickerViewType) {
        self.viewType = viewType
    }
    
    
    // MARK: - Helpers
    
    func numberOfItems() -> Int {
        switch viewType {
        case .colour:
            return Colours.allCases.count
        case .language:
            return Language.allCases.count
        case .units:
            return Units.allCases.count
        case .forecastDaily:
            return ForecastData.Daily.allCases.count
        case .forecastHourly:
            return ForecastData.Hourly.allCases.count
        case .forecastCurrently:
            return ForecastData.Currently.allCases.count
        case .temperature:
            return ForecastData.Temperature.allCases.count
        }
    }
    
    func pickerItemForRow(_ row: Int) -> String {
        switch viewType {
        case .colour:
            return Colours.allCases[row].rawValue.capitalized
        case .language:
            return Language.allCases[row].longName.capitalized
        case .units:
            return Units.allCases[row].longName
        case .forecastDaily:
            return ForecastData.Daily.allCases[row].rawValue
        case .forecastHourly:
            return ForecastData.Hourly.allCases[row].rawValue
        case .forecastCurrently:
            return ForecastData.Currently.allCases[row].rawValue
        case .temperature:
            return ForecastData.Temperature.allCases[row].rawValue
        }
    }
    
    func getScrollPosition() -> Int {
        var defaultScrollPosition = 0
        switch viewType {
        case .colour:
            for index in 0 ..< Colours.allCases.count {
                if Colours.allCases[index] == AppConstants.shared.colour {
                    defaultScrollPosition = index
                    break
                }
            }
        case .language:
            for index in 0 ..< Language.allCases.count {
                if Language.allCases[index] == AppConstants.shared.language {
                    defaultScrollPosition = index
                    break
                }
            }
        case .units:
            for index in 0 ..< Units.allCases.count {
                if Units.allCases[index] == AppConstants.shared.units {
                    defaultScrollPosition = index
                    break
                }
            }
        case .forecastDaily(let slot):
            for index in 0 ..< ForecastData.Daily.allCases.count {
                if ForecastData.Daily.allCases[index].rawValue == ForecastDataPoints.shared.Daily[slot] {
                    defaultScrollPosition = index
                    break
                }
            }
        case .forecastHourly(let slot):
            for index in 0 ..< ForecastData.Hourly.allCases.count {
                if ForecastData.Hourly.allCases[index].rawValue == ForecastDataPoints.shared.Hourly[slot] {
                    defaultScrollPosition = index
                    break
                }
            }
        case .forecastCurrently(let slot):
            for index in 0 ..< ForecastData.Currently.allCases.count {
                if ForecastData.Currently.allCases[index].rawValue == ForecastDataPoints.shared.Current[slot] {
                    defaultScrollPosition = index
                    break
                }
            }
        case .temperature:
            for index in 0 ..< ForecastData.Temperature.allCases.count {
                if ForecastData.Temperature.allCases[index].rawValue == ForecastDataPoints.shared.Current[0] {
                    defaultScrollPosition = index
                    break
                }
            }
        }
        return defaultScrollPosition
    }
    
    func saveNewValue(at index: Int) {
        switch viewType {
        case .colour: AppConstants.shared.colour = Colours.allCases[index]
        case .language: AppConstants.shared.language = Language.allCases[index]
        case .units: AppConstants.shared.units = Units.allCases[index]
        case .forecastDaily(let slot): ForecastDataPoints.shared.Daily[slot] = ForecastData.Daily.allCases[index].rawValue
        case .forecastHourly(let slot): ForecastDataPoints.shared.Hourly[slot] = ForecastData.Hourly.allCases[index].rawValue
        case .forecastCurrently(let slot): ForecastDataPoints.shared.Current[slot] = ForecastData.Currently.allCases[index].rawValue
        case .temperature: ForecastDataPoints.shared.Current[0] = ForecastData.Temperature.allCases[index].rawValue
        }
    }
    
    func getBackgroundColour(_ index: Int) -> UIColor {
        switch viewType {
        case .colour: return Colours.allCases[index].backgroundColour
        default: return .white
        }
    }
    
}
