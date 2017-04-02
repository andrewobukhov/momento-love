//
//  SignInViewController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 02/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarColor(color: UIColor.white, textColor: UIColor.black)
        
        self.setBackBarButtonTitle()
    }
}
