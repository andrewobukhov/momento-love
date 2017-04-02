//
//  UserService.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 28/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import Foundation
import Firebase

final class UserService {
    
    static let instance = UserService() //lazy init, and it only runs once

    lazy var usersRef: FIRDatabaseReference! = FIRDatabase.database().reference().child("users");
    
    private init() {
    }

    public func updateUser(values: [AnyHashable : Any]){
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {
            return
        }
        
        usersRef.child(uid).updateChildValues(values)
    }
    
    public func updateUser(user: User){
        let values = ["email": user.email, "sex": user.sex] as [AnyHashable : Any]
        updateUser(values: values)
    }
    
    func createUser(email: String, password: String, completion: FirebaseAuth.FIRAuthResultCallback? = nil){
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: completion)
    }
    
    func signIn(email: String, password: String, completion: FirebaseAuth.FIRAuthResultCallback? = nil) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: completion)
    }
}
