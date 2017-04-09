//
//  ProfileViewController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 04/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var profileImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarColor(color: .white, textColor: .black)
        
        UserService.instance.getCurrentUser(completion: {(user) in
            if let u = user {
                self.nameLbl.text = "\(u.name), \(u.age)"
                
                if let url = u.photos.last {
                    //self.profileImg.loadImage(imageUrl: url)
                    
                    self.profileImg.sd_setImage(with: URL(string: url))
                }
            }
        })
        
        initProfileImg()
    }
    
    func initProfileImg() {
        self.profileImg.layer.cornerRadius = self.profileImg.frame.size.width / 2;
        self.profileImg.clipsToBounds = true;
        
        
        if let navBar = self.navigationController?.navigationBar {
            extendedLayoutIncludesOpaqueBars = true
            navBar.tintColor = UIColor.black
            navBar.isTranslucent = true
            navBar.backgroundColor = UIColor.clear
            navBar.setBackgroundImage(UIImage(), for: .default)
            navBar.shadowImage = UIImage()
        }
        
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
        
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profileImg.image = image
            
            DispatchQueue.global().async {
                ImageService.instance.uploadImage(image)
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
