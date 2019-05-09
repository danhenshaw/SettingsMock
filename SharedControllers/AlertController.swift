//
//  AlertController.swift
//  Settings
//
//  Created by Daniel Henshaw on 8/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

/*
 Alert view added to superview.
 */

class AlertView: NSObject {
    
    // Show alert with ok Action to dismiss
    class func showAlert(view: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(okAction)
        view.present(alertController, animated: true, completion: nil)
    }
    
    // Show thank you message to user for sending feedback via email.
    class func showMessageSent(view: UIViewController) {
        let alertController = UIAlertController(title: "Feedback sent.", message: "Thank you for helping to improve Napp Weather.", preferredStyle: UIAlertController.Style.alert)
        view.present(alertController, animated: true, completion: nil)
        let when = DispatchTime.now() + 1.5
        DispatchQueue.main.asyncAfter(deadline: when) {
            view.dismiss(animated: true, completion: nil)
        }
    }
}
