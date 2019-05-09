//
//  SettingsViewModel.swift
//  Settings
//
//  Created by Daniel Henshaw on 2/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import Foundation

final class SettingsViewModel {
    
    // MARK: - Properties
    
    fileprivate var model: SettingsDataModel
    
    
    // MARK: - Initialiser
    
    init(withModel model: SettingsDataModel) {
        self.model = model
    }
    
    // MARK: - Helpers
    
    func numberOfSections() -> Int {
        return model.settings.count
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return model.settings[section].items.count
    }
    
    func settingItemForIndexPath(_ indexPath: IndexPath) -> SettingItem {
        let section = model.settings[indexPath.section]
        return section.items[indexPath.item]
    }
    
    func settingHeaderTitle(_ section: Int) -> String {
        return model.settings[section].name
    }
    
    /// Reseting the data model automatically deinitialises and re-initialises a new data model.
    /// This ensures that the app data retrieved from "App Constants" is up to date
    func updateModel() {
        model = SettingsDataModel()
    }
}
