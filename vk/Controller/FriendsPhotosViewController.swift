//
//  FriendsPhotosViewController.swift
//  vk
//
//  Created by Ksenia on 20.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class FriendsPhotosViewController: UIViewController {


    var friend: User!
    
    @IBOutlet weak var firstPhotoView: FriendsPhotoView!
    @IBOutlet weak var firstPhotoImageView: UIImageView!
    
    var i: Int = 0
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {

        // example task: animate view off screen
        if (gesture.direction == UISwipeGestureRecognizer.Direction.right) {
            print("Swipe right")
            i = i + friend.photos!.count - 1
            
        } else if gesture.direction == UISwipeGestureRecognizer.Direction.left {
            print("Swipe left")
            i += 1
        }
        i = i % friend.photos!.count
        firstPhotoImageView.image = friend.photos![i]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assert(friend != nil)
        
        title = "\(friend.firstName) \(friend.lastName)"
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRightGesture.direction = UISwipeGestureRecognizer.Direction.right
        swipeLeftGesture.direction = UISwipeGestureRecognizer.Direction.left
        firstPhotoView.addGestureRecognizer(swipeRightGesture)
        firstPhotoView.addGestureRecognizer(swipeLeftGesture)
       
    }
    override func viewDidAppear(_ animated: Bool) {
        
        print ("Did Appear")
    }

    override func viewWillAppear(_ animated: Bool) {
        
        firstPhotoImageView.image = friend.photos![i]
        print ("Will Appear")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
