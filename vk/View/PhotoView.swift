//
//  PhotoView.swift
//  vk
//
//  Created by Ksenia on 02.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

//@IBDesignable
class PhotoView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
//        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = .zero
//        layer.shadowRadius = 5
//        layer.shadowOpacity = 0.7
        
    }
    

}
