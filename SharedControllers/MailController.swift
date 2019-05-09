//
//  MailController.swift
//  Settings
//
//  Created by Daniel Henshaw on 9/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import MessageUI

/*
 Mail view added to superview when triggered by network request
 */

class MailView: NSObject {
    
    class func show(view: SettingsViewController) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = view
            mail.setToRecipients(["weather@napp.com"])
            mail.setSubject("Feedback for Napp Weather")
            view.present(mail, animated: true, completion: nil)
        } else {
            URLView.show(view: view, passedUrl: AppConstants.InternalUrls.email)
        }
    }
}
