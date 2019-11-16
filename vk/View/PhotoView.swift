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
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
    }

}
