//
//  LoginViewController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 31/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var birthdayTxt: UITextField!
    
    
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var datepickerView: UIView!
    
    @IBAction func editAction(_ sender: Any) {
        animateDatepicker(false)
    }
    
    @IBAction func emailEditingDidEndAction(_ sender: Any) {
        print("emailEditingDidEndAction")
    }
    
    @IBAction func datepickerDoneAction(_ sender: Any) {
        animateDatepicker(true)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd / M / yyyy"
        
        birthdayTxt.text = formatter.string(from: datepicker.date)
    }
    
    
    @IBAction func birthdayTouchDown(_ sender: Any) {
        animateDatepicker(false)
    }
    
    var datepickerPosition: CGFloat = CGFloat.init(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datepickerPosition = self.datepickerView.center.y
        
        datepickerView.isHidden = true
        
        animateDatepicker(true)
        
        datepickerView.layoutIfNeeded()
        
        datepickerView.layer.addBorder(edge: .top, color: UIColor.lightGray, thickness: CGFloat.init(0.5))
    }
    
    func animateDatepicker(_ isHidden: Bool) {
        datepickerView.isHidden = false
        
        birthdayTxt.isUserInteractionEnabled = isHidden
        
        let position = isHidden ? self.datepickerPosition + self.view.bounds.height : self.datepickerPosition
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: { self.datepickerView.center.y = position }, completion: nil)
    }
}
