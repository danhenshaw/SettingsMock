//
//  UrlController.swift
//  Settings
//
//  Created by Daniel Henshaw on 9/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

/*
 URL Controller redirecxts user to passed URL
 */

class URLView: NSObject {
    
    class func show(view: SettingsViewController, passedUrl: String) {
        if let url = URL(string: passedUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            } else {
                let error = ErrorModel(type: .general)
                AlertView.showAlert(view: view, title: error.message, message: "Please try again later.")
            }
        }
    }
}
