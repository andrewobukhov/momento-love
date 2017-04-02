//
//  UIViewControllerExt.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 01/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    
    func hideNavigationBar() {
        if let navBar = self.navigationController?.navigationBar {
            extendedLayoutIncludesOpaqueBars = true
            
            navBar.isTranslucent = true
            navBar.backgroundColor = UIColor.clear
            navBar.setBackgroundImage(UIImage(), for: .default)
            navBar.shadowImage = UIImage()
            
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
            
            navBar.tintColor = UIColor.lightGray
        }
        
    }

    func setNavigationBarColor(color: UIColor, textColor: UIColor) {
        if let navBar = self.navigationController?.navigationBar {
            navBar.barTintColor = color
            navBar.tintColor = textColor
        }
    }
    
    func setBackBarButtonTitle(title: String = String()) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
    }

    func addRightButtonToNavigationBar(title: String, color: UIColor, action: Selector?) {
        if let navBar = self.navigationController?.navigationBar {
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action:action)
            
            navBar.tintColor = color
        }
    }

    func createAlert(_ title: String, message: String = String(), btnTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

