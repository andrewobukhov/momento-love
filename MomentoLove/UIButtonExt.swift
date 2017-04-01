//
//  UIButtonExt.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 01/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit
import Foundation

extension UIButton {
    
    func addRadiusBorder(color: UIColor, radius: CGFloat,  thickness: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = thickness
        self.layer.cornerRadius = radius
    }
    
    func addRadiusBorder() {
        self.addRadiusBorder(color: UIColor.groupTableViewBackground, radius: 20, thickness: 2)
    }
    
}
