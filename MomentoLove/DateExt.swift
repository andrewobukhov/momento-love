//
//  DateExt.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 01/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import Foundation

extension Date {
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
}
