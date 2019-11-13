//
//  User.swift
//  vk
//
//  Created by Ksenia on 29.10.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import Foundation
import UIKit

class User {
    let photo: UIImage?
    let firstName: String
    let lastName: String
    let photos: [UIImage]?
    
    init(photo: UIImage, firstName: String, lastName: String, photos: [UIImage]) {
        self.photo = photo
        self.firstName = firstName
        self.lastName = lastName
        self.photos = photos
    }
    init(firstName: String, lastName: String, photos: [UIImage]){
        self.firstName = firstName
        self.lastName = lastName
        self.photo = nil
        self.photos = photos
    }
}
