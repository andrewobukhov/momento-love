//
//  Shared.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 27/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import Foundation

final class Shared {
    static let shared = Shared() //lazy init, and it only runs once
    
    var user: User!
}
