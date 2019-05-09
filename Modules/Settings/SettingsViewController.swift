//
//  SettingsViewController.swift
//  Settings
//
//  Created by Daniel Henshaw on 2/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit
import MessageUI

/*
Settings View Controller displays a grouped table view with data from the Settings Data Model.
*/

// MARK: - Protocols

protocol SettingsViewControllerFlowDelegate: class {
    func showDataPointView(_ senderViewController: SettingsViewController, dataPoint: DataPointSection)
    func showPickerView(_ senderViewController: SettingsViewController, type: PickerViewType)
}

class SettingsViewController : UIViewController {
    
    // MARK: - Properties
    
    fileprivate let viewModel: SettingsViewModel
    weak var flowDelegate: SettingsViewControllerFlowDelegate?
    var settingsView: SettingsView { return self.view as! SettingsView }
    
    
    // MARK: - Constants
    
    struct Constants {
        static let cellId = "CellId"
        static let headerId = "HeaderId"
    }
    
    // MARK: - Initialiser
    
    init(withViewModel viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView.tableView.dataSource = self
        settingsView.tableView.delegate = self
        settingsView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellId)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        viewModel.updateModel()
        settingsView.tableView.reloadData()
    }
    
    override func loadView() {
        view = SettingsView()
    }
    
    
    // MARK: - Actions
    
    /// Function that handles user did select cell action
    fileprivate func handleCellAction(_ action: SettingItemAction?) {

        guard let action = action else { return }
        switch action {
        case .openURL(let url):
            switch url {
            case .facebook: URLView.show(view: self, passedUrl: AppConstants.ExternalUrls.facebook)
            case .feedbackByEmail: MailView.show(view: self)
            case .instagram: URLView.show(view: self, passedUrl: AppConstants.ExternalUrls.instagram)
            case .privacy: URLView.show(view: self, passedUrl: AppConstants.ExternalUrls.nappPrivacy)
            case .rateAppOnAppStore: URLView.show(view: self, passedUrl: AppConstants.ExternalUrls.appStore)
            case .settings: URLView.show(view: self, passedUrl: AppConstants.InternalUrls.settings)
            case .share: ShareView.show(view: self)
            case .twitter: URLView.show(view: self, passedUrl: AppConstants.ExternalUrls.twitter)
            case .website: URLView.show(view: self, passedUrl: AppConstants.ExternalUrls.nappWebsite)
            }

        case .customise(let section):
            switch section {
            case .colour: flowDelegate?.showPickerView(self, type: .colour)
            case .currentDataPoints: flowDelegate?.showDataPointView(self, dataPoint: .current)
            case .hourlyDataPoints: flowDelegate?.showDataPointView(self, dataPoint: .hourly)
            case .dailyDataPoints: flowDelegate?.showDataPointView(self, dataPoint: .daily)
            case .language: flowDelegate?.showPickerView(self, type: .language)
            case .units: flowDelegate?.showPickerView(self, type: .units)
            }
        }
    }
    
}


    // MARK: - Table view delegate and datasource

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.settingHeaderTitle(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingItem = viewModel.settingItemForIndexPath(indexPath)
        let cell = UITableViewCell(style: settingItem.cellStyle, reuseIdentifier: Constants.cellId)
        cell.textLabel?.text = settingItem.title
        cell.detailTextLabel?.text = settingItem.subTitle
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let action = viewModel.settingItemForIndexPath(indexPath).action
        handleCellAction(action)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


    // MARK: - Mail Compose delegate

extension SettingsViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.sent.rawValue:
            AlertView.showMessageSent(view: self)
        case MFMailComposeResult.failed.rawValue:
            AlertView.showAlert(view: self, title: ErrorModel.ErrorTypes.general.localizedDescription, message: "Please try again later.")
            print("Error: \(String(describing: error?.localizedDescription))")
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
