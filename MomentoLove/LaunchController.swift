//
//  ViewController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 26/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit
import Firebase

class LaunchController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.perform(#selector(self.navigate), with: nil, afterDelay: 0)
    }
    
    func navigate(){
        let segueName =  UserService.instance.isLoggedIn() ? "profile" : "login";
        self.performSegue(withIdentifier: segueName, sender: self)
    }
}

