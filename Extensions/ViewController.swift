//
//  ViewController.swift
//  Settings
//
//  Created by Daniel Henshaw on 8/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

@nonobjc extension UIViewController {
    
    func add(_ child: UIViewController) {
        addChild(child)
        child.view.frame = CGRect(x: 0, y: self.view.frame.size.height, width: self.view.frame.size.width, height: 0)
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
    }
    
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
