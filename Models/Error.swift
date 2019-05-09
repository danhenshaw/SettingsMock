//
//  Error.swift
//  Settings
//
//  Created by Daniel Henshaw on 8/5/19.
//  Copyright © 2019 Dan Henshaw. All rights reserved.
//

import UIKit

/*
 Model for handling errors
 */

struct ErrorModel {
    
    /// Error types for indicating the type of error.
    enum ErrorTypes: Error {
        case custom(error: String), general
    }
    
    /// A type indicating the error type.
    var type: ErrorModel.ErrorTypes

    /// An error message to be displayed to the user.
    var message: String {
        switch self.type {
        case .general:
            return "Oops something went wrong."
        case .custom(let error):
            return error
        }
    }
}
