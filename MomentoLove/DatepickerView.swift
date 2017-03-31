//
//  DatepickerUIView.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 31/03/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class DatepickerView: UIView {

    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    
    @IBAction func doneAction(_ sender: Any) {
        self.isHidden = true
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
