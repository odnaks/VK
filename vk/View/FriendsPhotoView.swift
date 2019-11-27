//
//  FriendsPhotoView.swift
//  vk
//
//  Created by Ksenia on 26.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class FriendsPhotoView: UIControl {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @objc func imageTapped(){
        print ("swipe")
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {

        // example task: animate view off screen
        if (gesture.direction == UISwipeGestureRecognizer.Direction.right) {
            print("Swipe right")
        } else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            print("Swipe left")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //let tapGestureRecognizer =
        //UISwipeGestureRecognizer(target: self, action: #selector(imageTapped))
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRightGesture.direction = UISwipeGestureRecognizer.Direction.right
        swipeLeftGesture.direction = UISwipeGestureRecognizer.Direction.left
        self.addGestureRecognizer(swipeRightGesture)
        self.addGestureRecognizer(swipeLeftGesture)
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        // (1)
        print ("touches Began")
    }
}
