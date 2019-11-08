//
//  DrawingControl.swift
//  vk
//
//  Created by Ksenia on 02.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

//@IBDesignable
class DrawingControl: UIControl {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        
        context.move(to: CGPoint(x: rect.width/2, y: 0))
        context.addLine(to: CGPoint(x: rect.width/2, y: rect.height/2))
        context.addLine(to: CGPoint(x: 0, y: rect.height/2))
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
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        //layer.cornerRadius = 12
        layer.shadowOffset = .zero
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.7
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        
//        layer.mask = maskLayer
    }

}
