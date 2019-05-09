//
//  ForecastOverviewView.swift
//  Settings
//
//  Created by Daniel Henshaw on 8/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

/*
 Forecast Overview View is used by the Data Point View to show a mock example of what the data configuration will look like.
 */

class ForecastOverviewView: UIView {
    
    
    // MARK: - Properties
    
    lazy var stackView: UIStackView = {
       let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = 24
        view.layoutMargins = UIEdgeInsets(top: 24, left: 8, bottom: 24, right: 8)
        view.isLayoutMarginsRelativeArrangement = true
        return view
    }()
    
    lazy var leftStacView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()
    
    lazy var rightStacView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        return view
    }()
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 80, weight: .light)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var labelArray = [UILabel]()
    
    
    // MARK: - Initialiser
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    
    // MARK: - View configuration
    
    func setupLabels() {
        for index in 0 ..< 8 {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .light)
            label.textAlignment = .left
            label.textColor = .white
            labelArray.append(label)
            if index < 4 {
                leftStacView.addArrangedSubview(label)
            } else {
                rightStacView.addArrangedSubview(label)
            }
        }
    }
    
    func setupView() {
        stackView.addArrangedSubview(tempLabel)
        stackView.addArrangedSubview(leftStacView)
        stackView.addArrangedSubview(rightStacView)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    
    // MARK: - Update display
    
    func bindWith(temp: String, values: [String], hideTempLabel: Bool) {
        tempLabel.isHidden = hideTempLabel
        rightStacView.isHidden = !hideTempLabel
        tempLabel.text = temp
        for index in 0 ..< values.count {
            labelArray[index].text = values[index]
        }
    }
}
