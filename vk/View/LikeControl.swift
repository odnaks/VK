//
//  LikeControl.swift
//  vk
//
//  Created by Ksenia on 08.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class LikeControl: UIControl {

    @IBOutlet weak var counterLabel: UILabel!
    var isLiked: Bool = false
    var countLikes: Int = 99
    
    override func draw(_ rect: CGRect) {
            super.draw(rect)
        
            let path = UIBezierPath()
            let sideOne = rect.width * 0.4
            let sideTwo = rect.height * 0.3
            let arcRadius = sqrt(sideOne*sideOne + sideTwo*sideTwo)/2
            
            path.addArc(withCenter: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)

            path.addLine(to: CGPoint(x: rect.width/2, y: rect.height * 0.2))

            path.addArc(withCenter: CGPoint(x: rect.width * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)

            path.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.95))

            path.close()
            UIColor.red.setStroke()
            path.stroke()
            if (isLiked)
            {
                UIColor.red.setFill()
                path.fill()
            }

        }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let gr = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        addGestureRecognizer(gr)
        counterLabel.text = String(countLikes)
        
    }
    
   @objc func likeTapped(){
        print("likeTapped")
        isLiked = !isLiked
        if (isLiked)
        {
            countLikes = countLikes + 1
        }
        else {
            countLikes = countLikes - 1
        }
        counterLabel.text = String(countLikes)
        setNeedsDisplay()
    }

}

