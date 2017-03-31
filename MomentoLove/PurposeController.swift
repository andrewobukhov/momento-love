//
//  HereForController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 27/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class PurposeController: UIViewController {

    
    @IBAction func makeFriendsAction(_ sender: Any) {
        goNext(purpose: .friends)
    }
    
    @IBAction func chatAction(_ sender: Any) {
        goNext(purpose: .chat)
    }
    
    @IBAction func dateAction(_ sender: Any) {
        goNext(purpose: .date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func goNext(purpose: Purpose) {
        Shared.shared.user.purpose = purpose
        performSegue(withIdentifier: "login", sender: self)
    }
}
