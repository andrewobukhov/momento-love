//
//  ProfileViewController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 04/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarColor(color: .white, textColor: .black)
        
        UserService.instance.getCurrentUser(completion: {(user) in
            self.navigationItem.title = user?.name
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addPhotoAction(_ sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        DispatchQueue.global().async {
            if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                ImageService.instance.uploadImage(image)
            }
        }
       
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
