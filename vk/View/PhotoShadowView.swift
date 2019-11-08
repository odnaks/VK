//
//  PhotoShadowView.swift
//  vk
//
//  Created by Ksenia on 02.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

//@IBDesignable
class PhotoShadowView: UIView {

     override func draw(_ rect: CGRect) {
            super.draw(rect)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1
    }
}
