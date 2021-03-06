//
//  LoginViewController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 31/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let dateFormat = "dd / M / yyyy"
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var birthdayTxt: UITextField!
    
    
    @IBOutlet weak var logoImg: UIImageView!
    
    @IBOutlet weak var createAccount: UIButton!
    
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var datepickerView: UIView!
    
    @IBAction func editAction(_ sender: Any) {
        animateDatepicker(false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateDatepicker(true)
    }
    
    @IBAction func editingChanged(_ sender: Any) {
        Shared.shared.user.name = nameTxt.text != nil ? nameTxt.text! : String()
        Shared.shared.user.email = emailTxt.text != nil ? emailTxt.text! : String()
        
        validate()
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty() else {
            createAlert("Enter your email")
            return
        }
        
        guard let name = nameTxt.text, name.isNotEmpty() else {
            createAlert("Enter your name")
            return
        }
        
        UserService.instance.createUser(email: email, password: "only4you") {(user, error) in
            if let user = user {
                
                Shared.shared.user.id = user.uid
                UserService.instance.updateUser(user: Shared.shared.user)
                
                self.performSegue(withIdentifier: "profile", sender: self)
                
            } else if let e = error?.localizedDescription {
                self.createAlert(e)
            }
        }
    }
    
    
    @IBAction func datepickerDoneAction(_ sender: Any) {
        animateDatepicker(true)
        
        Shared.shared.user.birthday = datepicker.date
        
        birthdayTxt.text = datepicker.date.format(dateFormat)
        
        validate()
    }
    
    
    @IBAction func birthdayTouchDown(_ sender: Any) {
        animateDatepicker(false)
    }
    
    var datepickerPosition: CGFloat = CGFloat.init(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activate()
        
        self.datepickerPosition = self.datepickerView.center.y
        
        datepickerView.isHidden = true
        
        animateDatepicker(true)
        
        datepickerView.layoutIfNeeded()
        
        datepickerView.layer.addBorder(edge: .top, color: UIColor.lightGray, thickness: CGFloat.init(0.5))
    }
    
    func activate() {
        emailTxt.text = Shared.shared.user.email
        nameTxt.text = Shared.shared.user.name
        
        
        if let birthday = Shared.shared.user.birthday {
            birthdayTxt.text = birthday.format(dateFormat)
            datepicker.setDate(birthday, animated: false)
        }
        
        validate()
    }
    
    func animateDatepicker(_ isHidden: Bool) {
        view.endEditing(true)
        
        datepickerView.isHidden = false
        
        birthdayTxt.isUserInteractionEnabled = isHidden
        
        let position = isHidden ? self.datepickerPosition + self.view.bounds.height : self.datepickerPosition
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { self.datepickerView.center.y = position }, completion: nil)
    }
    
    func animateMakeBigLogo(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            //self.logoImg.bounds.size.width = 134
            //self.logoImg.bounds.size.height = 40
        }, completion: nil)
        
        //small x: 140 y: 28 width: 94 height: 30
        //big: x: 120 y: 43 width: 134 height: 40
    }
    
    func validate() {
        let u = Shared.shared.user
        
        let isValid = u?.email != String() && u?.name != String() && u?.birthday != nil
        
        createAccount.isUserInteractionEnabled = isValid
        
        let color = isValid ? UIColor.blue : UIColor.lightGray
        
        createAccount.setTitleColor(color, for: .normal)
    }
}
