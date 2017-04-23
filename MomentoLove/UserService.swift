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
    
    public var users: [User] = []
    
    private init() {
    }
    
    public static func getUid() -> String! {
        if let uid = FIRAuth.auth()?.currentUser?.uid {
            return uid
        }
        
        return nil
    }

    public func updateUser(user: User){
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {
            return
        }
        
        usersRef.child(uid).updateChildValues(user.getValues())
    }
    
    func createUser(email: String, password: String, completion: FirebaseAuth.FIRAuthResultCallback? = nil){
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: completion)
    }
    
    func signIn(email: String, password: String, completion: FirebaseAuth.FIRAuthResultCallback? = nil) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: completion)
    }

    func isLoggedIn() -> Bool {
        return FIRAuth.auth()?.currentUser?.uid != nil
    }
    
    func signOut() {
        try! FIRAuth.auth()?.signOut()
        
        Shared.shared.user = User()
    }
    
    func getCurrentUser(completion: @escaping (User?) -> Swift.Void) {
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {
            return
        }
        
        usersRef.child(uid).observeSingleEvent(of: .value, with: { (data) in
            Shared.shared.user = User.getUser(data.value as! [String: Any])
            
            Shared.shared.user.id = UserService.getUid() ?? String()
            completion(Shared.shared.user)
        })
    }
    
    func fetchUsers(completion: @escaping (User?) -> Swift.Void){
        usersRef.observe(.childAdded, with: { (data) in
            let user = User.getUser(data.value as! [String: Any])
            self.users.append(user)
            completion(user)
        })
    }
}
