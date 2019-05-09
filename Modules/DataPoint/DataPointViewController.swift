//
//  DataPointViewController.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

class DataPointViewController : UIViewController {
    
    // MARK: - Properties
    
    fileprivate let viewModel: DataPointViewModel
    fileprivate var pickerView: PickerViewController?
    var dataPointView: DataPointView { return self.view as! DataPointView }
    
    
    // MARK: - View Variables
    
    var selectedIndexPath: IndexPath? = nil
    var tempLabelText: String? = nil {
        didSet {
            updateExampleCell()
        }
    }
    
    
    // MARK: - Constants
    
    struct Constants {
        static let cellId = "CellId"
        static let headerId = "HeaderId"
    }
    
    
    // MARK: - Initialiser
    
    init(withViewModel viewModel: DataPointViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataPointView.tableView.dataSource = self
        dataPointView.tableView.delegate = self
        dataPointView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellId)
        let data = viewModel.exampleCellData()
        dataPointView.exampleCell.bindWith(temp: data.temp, values: data.values, hideTempLabel: data.hideTempLabel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        dataPointView.tableView.reloadData()
    }
    
    override func loadView() {
        view = DataPointView()
    }
    
    
    // MARK: - Actions

    fileprivate func togglePickerView(_ open: Bool, indexPath: IndexPath) {
        if pickerView == nil && open {
            addPickerView(indexPath: indexPath)
        } else if !open {
            removePickerView()
        } else if pickerView != nil {
            refreshPickerView(indexPath: indexPath)
        }
    }
    
    fileprivate func refreshPickerView(indexPath: IndexPath) {
        let dataPoint = viewModel.returnPickerViewType(indexPath)
        self.pickerView?.reloadInput(dataPoint)
        self.dataPointView.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    fileprivate func addPickerView(indexPath: IndexPath) {
        let dataPoint = viewModel.returnPickerViewType(indexPath)
        let pickerModel = PickerViewModel(viewType: dataPoint)
        pickerView = PickerViewController(withViewModel: pickerModel)
        pickerView?.showToolbar(true)
        pickerView?.parentVC = self
        self.add(pickerView!)
        UIView.animate(withDuration: 0.3, animations: {
            self.pickerView?.view.frame = CGRect(x: 0, y: self.view.frame.size.height - 225, width: self.view.frame.size.width, height: 225)
        }) { _ in
            self.dataPointView.bottomConstraint?.constant = -225
            self.dataPointView.layoutIfNeeded()
            self.dataPointView.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    func removePickerView() {
        self.dataPointView.bottomConstraint?.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.dataPointView.layoutIfNeeded()
            self.pickerView?.view.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: 225)
        }) { _ in
            self.pickerView?.remove()
            self.pickerView = nil
            self.selectedIndexPath = nil
            self.viewModel.updateModel()
            self.dataPointView.tableView.reloadData()
            let data = self.viewModel.exampleCellData()
            self.dataPointView.exampleCell.bindWith(temp: data.temp, values: data.values, hideTempLabel: data.hideTempLabel)
        }
    }
    
    fileprivate func updateExampleCell() {
        if viewModel.isCurrentDataPointView() && selectedIndexPath?.section == 1 {
            if let text = tempLabelText, let index = selectedIndexPath?.row {
                dataPointView.exampleCell.labelArray[index].text = text
            }
        } else if !viewModel.isCurrentDataPointView() {
            if let text = tempLabelText, let index = selectedIndexPath {
                dataPointView.exampleCell.labelArray[(4 * index.section) + index.row].text = text
            }
        }
    }


}


    // MARK: - Table view delegate and datasource

extension DataPointViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.dataPointHeaderTitle(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataPointItem = viewModel.dataPointItemForIndexPath(indexPath)
        let cell = UITableViewCell(style: .value1, reuseIdentifier: Constants.cellId)
        cell.textLabel?.text = dataPointItem.title
        cell.detailTextLabel?.text = dataPointItem.currentValue
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = selectedIndexPath == indexPath ? nil : indexPath
        togglePickerView(selectedIndexPath != nil, indexPath: indexPath)
        if selectedIndexPath == nil {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

}


