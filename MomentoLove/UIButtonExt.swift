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
    
    func loadingIndicator(_ title: String, show: Bool) {
        let tag = title.hash //Maybe need refactoring
        
        if show {
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            
            indicator.center = CGPoint(x: buttonWidth/2, y: buttonHeight/2)
            indicator.tag = tag
            
            self.setTitle(String(), for: .normal)
            self.backgroundColor = UIColor.lightGray
            
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            if let indicator = self.viewWithTag(tag) as? UIActivityIndicatorView {
                indicator.stopAnimating()
                indicator.removeFromSuperview()
                
                self.backgroundColor = UIColor.init(red: 37/255, green: 108/255, blue: 245/255, alpha: 1)
                
                self.setTitle(title, for: .normal)
            }
        }
    }
}
