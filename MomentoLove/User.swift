//
//  User.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 27/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import Foundation

final class User {
    
    public var id: String = String()
    
    public var email: String = String()
    
    public var name: String = String()
    
    public var birthday: Date!
    
    public var sex: Sex = Sex.male
    
    public var purpose: Purpose = Purpose.friends
    
    public var photos: [String] = []
    
    public init(id: String, email: String, name: String)
    {
        self.id = id
        self.email = email
        self.name = name
    }
    
    public init(){}
    
    public func getValues() -> [AnyHashable : Any] {
        return [
            "id": self.id,
            "email": self.email,
            "name": self.name,
            "birthday": self.birthday.timeIntervalSince1970,
            "sex": self.sex.rawValue,
            "purpose": self.purpose.rawValue,
            "photos": self.photos
            ] as [AnyHashable : Any]
    }
    
    public static func getUser(_ data: [String : Any]) -> User {
        let user = User()
        
        user.id = (data["id"] as? String) ?? String()
        
        user.email = (data["email"] as? String) ?? String()
        
        user.name = (data["name"] as? String) ?? String()
        
        user.photos = (data["photos"] as? [String]) ?? []
        
        if let i = data["sex"] as? Int, let sex = Sex.init(rawValue: i) {
            user.sex = sex
        }

        user.birthday = Date()
        if let i = data["birthday"] as? Double {
            user.birthday = Date.init(timeIntervalSince1970: i)
        }
        
        if let i = data["purpose"] as? Int, let purpose = Purpose.init(rawValue: i) {
            user.purpose = purpose
        }
        
        return user
    }
}

enum Sex: Int {
    case male
    case female
}

enum Purpose: Int {
    case friends
    case chat
    case date
}
