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
            // Drawing code
            super.draw(rect)
//            guard let context = UIGraphicsGetCurrentContext() else { return }
            
            layer.masksToBounds = false
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = .zero
            layer.shadowRadius = 5
            layer.shadowOpacity = 1
            
        }

}
