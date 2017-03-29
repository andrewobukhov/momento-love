//
//  DataService.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 28/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import Foundation
import Firebase

final class DataService {
    static var ref: FIRDatabaseReference! = nil;
    
    static func getRef() -> FIRDatabaseReference {
        if ref == nil {
            ref = FIRDatabase.database().reference()
        }
        
        return ref
    }
}
