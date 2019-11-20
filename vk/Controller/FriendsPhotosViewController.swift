//
//  FriendsPhotosViewController.swift
//  vk
//
//  Created by Ksenia on 20.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class FriendsPhotosViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    var friend: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        assert(friend != nil)
        
        title = "\(friend.firstName) \(friend.lastName)"
       
    }
    override func viewDidAppear(_ animated: Bool) {
        
        print ("Did Appear")
    }

    override func viewWillAppear(_ animated: Bool) {
        photoImageView.image = friend.photos![0]
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
