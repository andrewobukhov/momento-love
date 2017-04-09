//
//  UIImageViewExt.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 08/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit
import Foundation

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImage(imageUrl: String){
        
        self.image = nil
        
        let key =  NSString.init(string: imageUrl)
        
        if let cachedImage = imageCache.object(forKey: key)
        {
            self.image = cachedImage
            return
        }
        
        let url = URL(string: imageUrl)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let e = error {
                print(e)
            } else {
                DispatchQueue.main.async {
                    if let downloadedImage = UIImage(data: data!) {
                        imageCache.setObject(downloadedImage, forKey: key)
                        self.image = downloadedImage
                    }
                }
            }
        }.resume()
    }
}
