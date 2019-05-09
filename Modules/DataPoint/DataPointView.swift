//
//  DataPointView.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

class DataPointView: UIView {
    
    // MARK: - Properties
    
    lazy var exampleCell: ForecastOverviewView = {
        let view = ForecastOverviewView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.separatorStyle = .singleLine
        view.separatorColor = .darkGray
        view.estimatedRowHeight = UITableView.automaticDimension
        view.rowHeight = UITableView.automaticDimension
        view.separatorStyle = .singleLine
        return view
    }()
    
    
    // MARK: - View Variables
    
    var bottomConstraint: NSLayoutConstraint?
    
    
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
        addSubview(exampleCell)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        exampleCell.translatesAutoresizingMaskIntoConstraints = false
        exampleCell.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        exampleCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        exampleCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        exampleCell.heightAnchor.constraint(equalToConstant: 150).isActive = true

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: exampleCell.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        bottomConstraint = tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        bottomConstraint?.isActive = true
    
    }
    
    
}
