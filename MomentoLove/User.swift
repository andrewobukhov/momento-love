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
    public var name: String
    
    public var sex: Sex = Sex.male
    public var purpose: Purpose = Purpose.friends
    
    public init(id: String, email: String, name: String)
    {
        self.id = id
        self.email = email
        self.name = name
    }
    
    public init(){
        self.id = ""
        self.email = ""
        self.name = ""
    }
}

enum Sex{
    case male
    case female
}

enum Purpose {
    case friends
    case chat
    case date
}
