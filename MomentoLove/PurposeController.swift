//
//  HereForController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 27/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class PurposeController: UIViewController {

    @IBOutlet weak var makeFriendsBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var dateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [dateBtn, chatBtn, makeFriendsBtn].forEach { btn in
            btn.addRadiusBorder()
        }
        
        self.hideNavigationBar()
    }
    
    @IBAction func makeFriendsAction(_ sender: Any) {
        goNext(purpose: .friends)
    }
    
    @IBAction func chatAction(_ sender: Any) {
        goNext(purpose: .chat)
    }
    
    @IBAction func dateAction(_ sender: Any) {
        goNext(purpose: .date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func goNext(purpose: Purpose) {
        Shared.shared.user.purpose = purpose
        performSegue(withIdentifier: "login", sender: self)
    }
}
