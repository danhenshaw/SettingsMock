//
//  ShareController.swift
//  Settings
//
//  Created by Daniel Henshaw on 9/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

/*
 Share view added to superview
 */

class ShareView: NSObject {
    
    class func show(view: SettingsViewController) {
        let title = "Napp Weather"
        //        let image : UIImage = UIImage(named: "image.jpg")!
        if let url = NSURL(string: AppConstants.ExternalUrls.nappWebsite) {
            let activityItems = [title, url] as [Any]
            let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
            activityViewController.excludedActivityTypes = [UIActivity.ActivityType.addToReadingList]
            view.present(activityViewController, animated: true, completion: nil)
        }
    }
}
