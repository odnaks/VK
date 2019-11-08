//
//  LikeControl.swift
//  vk
//
//  Created by Ksenia on 08.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class LikeControl: UIControl {

     override func draw(_ rect: CGRect) {
            // Drawing code
            super.draw(rect)
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.saveGState()
            
            context.move(to: CGPoint(x: 0, y: 0))
            context.addLine(to: CGPoint(x: rect.width, y: 0))
            context.addLine(to: CGPoint(x: rect.width, y: rect.height))
            context.addLine(to: CGPoint(x: 0, y: rect.height))
            context.closePath()

            context.setStrokeColor(UIColor.black.cgColor)
            context.strokePath()

            context.restoreGState()
            
            //layer.masksToBounds = true
    //        let maskLayer = CAShapeLayer()
    //        let path = UIBezierPath(arcCenter: CGPoint(x: rect.width / 2, y: rect.height / 2),
    //        radius: 100, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: false)
    //
    //        path.lineWidth = 5
    //        let color = UIColor.red
    //        color.setStroke()
    //        path.stroke()
    //
    //        maskLayer.path = path.cgPath // Тот path, с помощью которого рисовали звезду
            
    //        layer.masksToBounds = true
           // layer.cornerRadius = 12
          
            
    //        layer.mask = maskLayer
        }


}
