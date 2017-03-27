//
//  User.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 27/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import Foundation

final class User {
    public var id: String
    public var email: String
    
    public init(id: String, email: String)
    {
        self.id = id
        self.email = email
    }
}
