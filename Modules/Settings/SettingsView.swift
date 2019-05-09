//
//  SettingsView.swift
//  Settings
//
//  Created by Daniel Henshaw on 2/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    // MARK: - Properties
    
    lazy var tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.separatorStyle = .singleLine
        view.separatorColor = .darkGray
        view.estimatedRowHeight = UITableView.automaticDimension
        view.rowHeight = UITableView.automaticDimension
        view.separatorStyle = .singleLine
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
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    
}
