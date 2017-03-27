//
//  ViewController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 26/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    @IBAction func loginAction(_ sender: Any) {
        

        guard let email = emailText.text, let password = passwordText.text else {
            self.errorLabel.text = "Form is not valid!"
            return
        }
        
        if segmentControl.selectedSegmentIndex == 0 {
            self.login(email: email, password: password)
        }
        else{
            self.createUser(email: email, password: password)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func login(email: String, password: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password) {(user, error) in
            if let user = user{
                self.goHome(user: user)
                
            } else if let e = error?.localizedDescription {
                self.errorLabel.text = e
            }
            
        }
    }
    
    func createUser(email: String, password: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password) {(user, error) in
            if let user = user {
                self.goHome(user: user)
            } else if let e = error?.localizedDescription {
                self.errorLabel.text = e
            }
            
        }
    }
    
    func goHome(user: FIRUser){
        Shared.shared.user = User(id: user.uid, email: user.email!)
        self.performSegue(withIdentifier: "home", sender: self)
    }
}

