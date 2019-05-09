//
//  DataPointDataModel.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

struct DataPointGroup {
    let name: String
    var isExpanded: Bool
    let items: [DataPointItem]
}

struct DataPointItem {
    let title: String
    let currentValue: String?
}

class DataPointDataModel {
    
    var currentDataPoints = [

        DataPointGroup(name: "temp", isExpanded: true, items: [DataPointItem(title: "temperature", currentValue: ForecastDataPoints.shared.Current[0])]),
        
        DataPointGroup(name: "right", isExpanded: true, items: [DataPointItem(title: "slot one", currentValue: ForecastDataPoints.shared.Current[1]),
                                                                DataPointItem(title: "slot two", currentValue: ForecastDataPoints.shared.Current[2]),
                                                                DataPointItem(title: "slot three", currentValue: ForecastDataPoints.shared.Current[3]),
                                              DataPointItem(title: "slot four", currentValue: ForecastDataPoints.shared.Current[4])]
        )
    ]
    
    var hourlyDataPoints = [

        DataPointGroup(name: "left", isExpanded: true, items: [DataPointItem(title: "slot one", currentValue: ForecastDataPoints.shared.Hourly[0]),
                                                               DataPointItem(title: "slot two", currentValue: ForecastDataPoints.shared.Hourly[1]),
                                                               DataPointItem(title: "slot three", currentValue: ForecastDataPoints.shared.Hourly[2]),
                                                               DataPointItem(title: "slot four", currentValue: ForecastDataPoints.shared.Hourly[3])]
        ),
        
        DataPointGroup(name: "right", isExpanded: true, items: [DataPointItem(title: "slot one", currentValue: ForecastDataPoints.shared.Hourly[4]),
                                                                DataPointItem(title: "slot two", currentValue: ForecastDataPoints.shared.Hourly[5]),
                                                                DataPointItem(title: "slot three", currentValue: ForecastDataPoints.shared.Hourly[6]),
                                                                DataPointItem(title: "slot four", currentValue: ForecastDataPoints.shared.Hourly[7])]
        )
    ]
    
    var dailyDataPoints = [

        DataPointGroup(name: "left", isExpanded: true, items: [DataPointItem(title: "slot one", currentValue: ForecastDataPoints.shared.Daily[0]),
                                                               DataPointItem(title: "slot two", currentValue: ForecastDataPoints.shared.Daily[1]),
                                                               DataPointItem(title: "slot three", currentValue: ForecastDataPoints.shared.Daily[2]),
                                                               DataPointItem(title: "slot four", currentValue: ForecastDataPoints.shared.Daily[3])]
        ),
        
        DataPointGroup(name: "right", isExpanded: true, items: [DataPointItem(title: "slot one", currentValue: ForecastDataPoints.shared.Daily[4]),
                                                                DataPointItem(title: "slot two", currentValue: ForecastDataPoints.shared.Daily[5]),
                                                                DataPointItem(title: "slot three", currentValue: ForecastDataPoints.shared.Daily[6]),
                                                                DataPointItem(title: "slot four", currentValue: ForecastDataPoints.shared.Daily[7])]
        )
    ]
    
}
