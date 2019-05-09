//
//  SettingsDataModel.swift
//  Settings
//
//  Created by Daniel Henshaw on 2/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

enum SettingItemAction {
    
    enum URL { case website, instagram, facebook, twitter, settings, rateAppOnAppStore, feedbackByEmail, share, privacy }
    enum Customiseable { case units, language, currentDataPoints, hourlyDataPoints, dailyDataPoints, colour }
    
    case openURL(_ url: URL)
    case customise(_ section: Customiseable)
}

struct SettingsGroup {
    let name: String
    let items: [SettingItem]
}

struct SettingItem {
    let title: String
    let subTitle: String?
    let action: SettingItemAction
    let cellStyle: UITableViewCell.CellStyle
}

class SettingsDataModel {

    var settings = [
        
        SettingsGroup(
            name: "Privacy",
            items: [
                SettingItem(title: "Settings", subTitle: "Open phone settings", action: .openURL(.settings), cellStyle: .subtitle),
                SettingItem(title: "Privacy", subTitle: nil, action: .openURL(.privacy), cellStyle: .default)
            ]
        ),
        

        SettingsGroup(
            name: "Customise",
            items: [
                SettingItem(title: "Language", subTitle: AppConstants.shared.language.longName.capitalized, action: .customise(.language), cellStyle: .value1),
                SettingItem(title: "Units", subTitle: AppConstants.shared.units.longName, action: .customise(.units), cellStyle: .value1),
                SettingItem(title: "Colour", subTitle: AppConstants.shared.colour.rawValue.capitalized, action: .customise(.colour), cellStyle: .value1)
            ]
        ),
        
        SettingsGroup(
            name: "Data Points",
            items: [
                SettingItem(title: "Current", subTitle: nil, action: .customise(.currentDataPoints), cellStyle: .default),
                SettingItem(title: "Hourly", subTitle: nil, action: .customise(.hourlyDataPoints), cellStyle: .default),
                SettingItem(title: "Daily", subTitle: nil, action: .customise(.dailyDataPoints), cellStyle: .default),
            ]
        ),
        
        SettingsGroup(
            name: "General",
            items: [
                SettingItem(title: "Share", subTitle: nil, action: .openURL(.share), cellStyle: .default),
                SettingItem(title: "Feedback and Support", subTitle: nil, action: .openURL(.feedbackByEmail), cellStyle: .default),
                SettingItem(title: "Rate App", subTitle: "Review on the App Store", action: .openURL(.rateAppOnAppStore), cellStyle: .default)
            ]
        ),
        
        
        SettingsGroup(
            name: "About",
            items: [
                SettingItem(title: "Website", subTitle: nil, action: .openURL(.website), cellStyle: .default),
                SettingItem(title: "Facebook", subTitle: nil, action: .openURL(.facebook), cellStyle: .default),
                SettingItem(title: "Instagram", subTitle: nil, action: .openURL(.instagram), cellStyle: .default),
                SettingItem(title: "Twitter", subTitle: nil, action: .openURL(.twitter), cellStyle: .default)
            ]
        )
    ]
}
