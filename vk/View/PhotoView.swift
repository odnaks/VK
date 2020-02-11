//
//  PhotoView.swift
//  vk
//
//  Created by Ksenia on 02.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class PhotoView: UIView {

    @objc func imageTapped()
    {

        print ("image tapped")
        UIView.animate(withDuration: 0.5,
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
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
}
