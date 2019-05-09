//
//  Colour.swift
//  Settings
//
//  Created by Daniel Henshaw on 3/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

enum Colours: String, CaseIterable {
    
    case dark, light, red, blue
    
    public var backgroundColour: UIColor {
        switch self {
        case .dark : return UIColor.black
        case .light : return UIColor.white
        case .red : return UIColor.red
        case .blue : return UIColor.blue
        }
    }
}
