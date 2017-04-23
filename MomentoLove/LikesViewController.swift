//
//  LikesViewController.swift
//  MomentoLove
//
//  Created by Andrew Obukhov on 23/04/2017.
//  Copyright © 2017 Andrew Obukhov. All rights reserved.
//

import UIKit

class LikesViewController: UIViewController {

    var scrollWidth: CGFloat = 0
    var scrollHeight: CGFloat = 0
    
    var currentUserIndex: Int = 0
    
    @IBOutlet weak var imagesScrollView: UIScrollView!
    
    @IBAction func likeAction(_ sender: Any) {
        currentUserIndex += 1
        setImages(user: UserService.instance.users[currentUserIndex])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollWidth = imagesScrollView.frame.width
        self.scrollHeight = imagesScrollView.frame.height
        
        setImages(user: Shared.shared.user)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setImages(user: User){
        for (i, photo) in user.photos.enumerated() {
            print("Item \(i): \(photo)")
            
            let image = UIImageView()
            image.sd_setImage(with: URL(string: photo))
            image.contentMode = .scaleToFill
            
            let xPosition = CGFloat(i) * scrollWidth
            
            image.frame = CGRect(x: xPosition, y: 0, width: scrollWidth, height: scrollHeight)
            imagesScrollView.contentSize.width = scrollWidth * CGFloat(i + 1)
            imagesScrollView.addSubview(image)
            
        }
    }

}
