//
//  YouAreController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 27/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class SexController: UIViewController {
    
    
    @IBAction func maleButton(_ sender: UIButton) {
        goNext(sex: Sex.male)
    }
    
    @IBAction func femaleButton(_ sender: UIButton) {
        goNext(sex: Sex.female)
    }
    
    func goNext(sex: Sex) {
        Shared.shared.user.sex = sex
        performSegue(withIdentifier: "purpose", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let navBar = self.navigationController?.navigationBar {
            extendedLayoutIncludesOpaqueBars = true
            navBar.isTranslucent = true
            navBar.backgroundColor = UIColor.clear
            navBar.setBackgroundImage(UIImage(), for: .default)
            navBar.shadowImage = UIImage()
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
            
            navBar.tintColor = UIColor.red
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
