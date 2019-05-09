//
//  DataPointViewModel.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import Foundation

enum DataPointSection: String { case current, hourly, daily }

final class DataPointViewModel {
    
    // MARK: - Properties
    
    fileprivate var model: DataPointDataModel
    fileprivate var dataPointSection: DataPointSection
    
    
    // MARK: - Initialiser
    
    init(withModel model: DataPointDataModel, dataPointSection: DataPointSection) {
        self.model = model
        self.dataPointSection = dataPointSection
    }
    
    
    // MARK: - Helpers
    
    func numberOfSections() -> Int {
        switch dataPointSection {
        case .current: return model.currentDataPoints.count
        case .daily: return model.dailyDataPoints.count
        case .hourly: return model.hourlyDataPoints.count
        }
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        switch dataPointSection {
        case .current: return model.currentDataPoints[section].items.count
        case .daily: return model.dailyDataPoints[section].isExpanded ? model.dailyDataPoints[section].items.count : 0
        case .hourly: return model.hourlyDataPoints[section].items.count
        }
    }
    
    func isCurrentDataPointView() -> Bool {
        return dataPointSection == .current
    }

    func dataPointItemForIndexPath(_ indexPath: IndexPath) -> DataPointItem {
        switch dataPointSection {
        case .current:
            return model.currentDataPoints[indexPath.section].items[indexPath.item]
        case .daily:
            return model.dailyDataPoints[indexPath.section].items[indexPath.item]
        case .hourly:
            return model.hourlyDataPoints[indexPath.section].items[indexPath.item]
        }
    }

    func dataPointHeaderTitle(_ section: Int) -> String {
        switch dataPointSection {
        case .current: return model.currentDataPoints[section].name
        case .daily: return model.dailyDataPoints[section].name
        case .hourly: return model.hourlyDataPoints[section].name
        }
    }
    
    func returnPickerViewType(_ indexPath: IndexPath) -> PickerViewType {
        switch dataPointSection {
        case .current:
            switch indexPath {
            case IndexPath(row: 0, section: 0): return .temperature
            default: return .forecastCurrently(slot: indexPath.row + 1) // +1 because the first data point slot is for the temperature data
            }
        case .daily:
            switch indexPath.section {
            case 0: return .forecastDaily(slot: indexPath.row) 
            default: return .forecastDaily(slot: (4 * indexPath.section) + indexPath.row)
            }
        case .hourly:
        switch indexPath.section {
        case 0: return .forecastHourly(slot: indexPath.row)
        default: return .forecastHourly(slot: (4 * indexPath.section) + indexPath.row)
            }
        }
    }
    
    func exampleCellData() -> (temp: String, values: [String], hideTempLabel: Bool) {
        var dataArray = Array(repeating: "", count: 8)
        let temp = " 23°"
        switch dataPointSection {
        case .current:
            dataArray = ForecastDataPoints.shared.Current
            dataArray.remove(at: 0)
        case .daily:
            dataArray = ForecastDataPoints.shared.Daily
        case .hourly:
            dataArray = ForecastDataPoints.shared.Hourly
        }
        return (temp: temp, values: dataArray, hideTempLabel: dataPointSection != .current)
    }

    /// Reseting the data model automatically deinitialises and re-initialises a new data model.
    /// This ensures that the app data retrieved from "App Constants" is up to date
    func updateModel() {
        model = DataPointDataModel()
    }
}
