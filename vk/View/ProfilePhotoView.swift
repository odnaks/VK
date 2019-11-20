//
//  ProfilePhotoView.swift
//  vk
//
//  Created by Ksenia on 20.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class ProfilePhotoView: UIView {
    
    @objc func imageTapped()
        {
    //        let tappedImage = tapGestureRecognizer.view as! UIImageView

             //let scaleTransform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            
            print ("image tapped")
            
            UIView.animate(withDuration: 0.3,
            delay: 0,
            animations: {
                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }, completion: { _ in
                UIView.animate(withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0,
                options: [],
                animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
            })

        }
        
        
        override func awakeFromNib() {
            super.awakeFromNib()

            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            //        imageView.isUserInteractionEnabled = true
            self.addGestureRecognizer(tapGestureRecognizer)
        }

}
