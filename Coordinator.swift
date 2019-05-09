//
//  Coordinator.swift
//  Settings
//
//  Created by Daniel Henshaw on 9/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit
import MessageUI

 /*
 Coordinator is responsible for initialising the navigation controller and presenting all new view controllers.
 */

class Coordinator {
    
    fileprivate let window: UIWindow
    fileprivate weak var navigationController: NavigationController?
    
    init(withWindow window: UIWindow) {
        self.window = window
    }
    
    func showMainScren() {
        let dataModel = SettingsDataModel()
        let viewModel = SettingsViewModel(withModel: dataModel)
        let viewController = SettingsViewController(withViewModel: viewModel)
        viewController.flowDelegate = self
        viewController.title = "Settings"
        let navigationController = NavigationController(rootViewController: viewController)
        self.navigationController = navigationController
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}


extension Coordinator: SettingsViewControllerFlowDelegate {
    
    func showDataPointView(_ senderViewController: SettingsViewController, dataPoint: DataPointSection) {
        let dataModel = DataPointDataModel()
        let viewModel = DataPointViewModel(withModel: dataModel, dataPointSection: dataPoint)
        let viewController = DataPointViewController(withViewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        viewController.title = "\(dataPoint.rawValue.capitalized) Data Points"
    }
    
    func showPickerView(_ senderViewController: SettingsViewController, type: PickerViewType) {
        let viewModel = PickerViewModel(viewType: type)
        let viewController = PickerViewController(withViewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
        switch type {
        case .colour: viewController.title = "Set Colour Preference"
        case .language: viewController.title = "Set Language Preference"
        case .units: viewController.title = "Set Units Preference"
        default: break
        }
    }

}
