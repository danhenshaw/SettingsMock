//
//  PickerViewController.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

class PickerViewController : UIViewController {
    
    
    // MARK: - Properties
    
    fileprivate let viewModel: PickerViewModel
    weak var parentVC: DataPointViewController?
    var pickerView: PickerView { return self.view as! PickerView }
    
    
    // MARK: - View Variables
    
    fileprivate var selectedIndex: Int?
    fileprivate var defaultIndex: Int
    
    
    // MARK: - Initialiser

    init(withViewModel viewModel: PickerViewModel) {
        self.viewModel = viewModel
        defaultIndex = viewModel.getScrollPosition()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.pickerView.dataSource = self
        pickerView.pickerView.delegate = self
        pickerView.cancelButton.target = self
        pickerView.cancelButton.action = #selector(closeButtonTapped)
        pickerView.saveButton.target = self
        pickerView.saveButton.action = #selector(saveButtonTapped)
        pickerView.pickerView.selectRow(defaultIndex, inComponent: 0, animated: false)
        setupNavBar()
        updateBackgroundColour(defaultIndex)
    }
    
    override func loadView() {
        view = PickerView()
    }
    
    
    // MARK: - Actions
    
    @objc func saveButtonTapped() {
        if let index = selectedIndex {
            viewModel.saveNewValue(at: index)
            
            if let parentVC = parentVC {
                parentVC.removePickerView()
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @objc func closeButtonTapped() {
        parentVC?.removePickerView()
    }
    
    fileprivate func setupNavBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func reloadInput(_ viewType: PickerViewType) {
        viewModel.viewType = viewType
        defaultIndex = viewModel.getScrollPosition()
        pickerView.pickerView.reloadAllComponents()
        pickerView.pickerView.selectRow(defaultIndex, inComponent: 0, animated: true)
    }
    
    func showToolbar(_ show: Bool) {
        pickerView.toolbar.isHidden = !show
    }
    
    fileprivate func updateBackgroundColour(_ index: Int) {
        let colour = viewModel.getBackgroundColour(index)
        UIView.animate(withDuration: 0.5, animations: {
            self.pickerView.pickerView.backgroundColor = colour
        }) { _ in
            self.pickerView.pickerView.reloadAllComponents()
        }
    }
    
    
}

    // MARK: - Pivcker view delegate and datasource

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let pickerItem = viewModel.pickerItemForRow(row)
        let titleText = NSLocalizedString(pickerItem, comment: "")
        let textColour = self.pickerView.pickerView.backgroundColor == .white ? UIColor.black : UIColor.white
        let myTitle = NSAttributedString(string: titleText, attributes: [NSAttributedString.Key.foregroundColor: textColour])
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickerView.saveButton.isEnabled = defaultIndex != row
        self.navigationItem.rightBarButtonItem?.isEnabled = defaultIndex != row
        selectedIndex = row
        parentVC?.tempLabelText = viewModel.pickerItemForRow(row)
        updateBackgroundColour(row)
    }

}
