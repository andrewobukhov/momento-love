//
//  SignInViewController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 02/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var userTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func signIn(_ sender: UIButton) {
        
        guard let email = userTxt.text, email.isNotEmpty() else {
            createAlert("Enter your email address")
            return
        }
        
        guard let password = passwordTxt.text, password.isNotEmpty() else {
            createAlert("Enter your password")
            return
        }
        
        sender.loadingIndicator("Sign in", show: true)
        
        UserService.instance.signIn(email: email, password: password) {(user, error) in
            if let user = user {
                
                Shared.shared.user.id = user.uid
                
                self.performSegue(withIdentifier: "profile", sender: self)
            } else if let e = error?.localizedDescription {
                self.createAlert(e)
            }
            
            sender.loadingIndicator("Sign in", show: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarColor(color: UIColor.white, textColor: UIColor.black)
        
        self.setBackBarButtonTitle()
    }
}
