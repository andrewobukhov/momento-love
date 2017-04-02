//
//  StringExt.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 02/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import Foundation


extension String {
    func isEmpty() -> Bool {
        return self == String()
    }
    
    func isNotEmpty() -> Bool {
        return !self.isEmpty()
    }
}
