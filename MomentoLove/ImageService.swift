//
//  UserService.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 28/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import Foundation
import Firebase

final class ImageService {
    
    static let instance = ImageService() //lazy init, and it only runs once
    
    lazy var storageRef = FIRStorage.storage().reference().child("images");
    
    private init() {
    }
    
    func uploadImage(_ image: UIImage) -> FIRStorageUploadTask! {
        if let data = UIImagePNGRepresentation(image), let uid = UserService.getUid() {
            
            let uuid = UUID().uuidString
            
            // Create a reference to the file you want to upload
            let ref = storageRef.child("\(uid)/\(uuid)")

            return ref.put(data, metadata: nil) { (metadata, error) in
                
                // Metadata contains file metadata such as size, content-type, and download URL.
                if let url = metadata?.downloadURL()?.absoluteString
                {
                    Shared.shared.user.photos.append(url);
                    UserService.instance.updateUser(user: Shared.shared.user);
                }
            }
        }
        
        return nil
    }
}
