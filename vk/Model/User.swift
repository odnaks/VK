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
    
    init(photo: UIImage, firstName: String, lastName: String) {
        self.photo = photo
        self.firstName = firstName
        self.lastName = lastName
    }
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
        self.photo = nil
    }
}
