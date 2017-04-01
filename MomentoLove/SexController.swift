//
//  YouAreController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 27/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class SexController: UIViewController {
    
    
    @IBOutlet weak var maleBtn: UIButton!
    
    @IBOutlet weak var femaleBtn: UIButton!
    
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
        
        maleBtn.addRadiusBorder()
        femaleBtn.addRadiusBorder()
        
        self.hideNavigationBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
