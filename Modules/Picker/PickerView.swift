//
//  PickerView.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

enum PickerViewType { case colour, units, language, forecastDaily(slot: Int), forecastHourly(slot: Int), forecastCurrently(slot: Int), temperature }

class PickerView: UIView {
    
    
    // MARK: - Properties
    
    var cancelButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        return button
    }()
    
    var saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
        button.isEnabled = false
        return button
    }()
    
    lazy var toolbar: UIToolbar = {
        let view = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        view.setItems([cancelButton, flexSpace, saveButton], animated: false)
        view.sizeToFit()
        return view
    }()
    
    lazy var pickerView: UIPickerView = {
        let view = UIPickerView()
        return view
    }()
    
    
    // MARK: - Initialiser
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - View configuration
    
    func setupView() {
        backgroundColor = .white
        addSubview(toolbar)
        addSubview(pickerView)
        toolbar.isHidden = true
    }
    
    func setupConstraints() {
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        toolbar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        toolbar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        toolbar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 0).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
}

