//
//  User.swift
//  vk
//
//  Created by Ksenia on 29.10.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class User: Object {
    @objc dynamic var photoLink: String = "https://sun1-83.userapi.com/c836333/v836333001/31189/8To0r3d-6iQ.jpg"
    @objc dynamic var firstName: String = "Pavel"
    @objc dynamic var lastName: String = "Durov"
    @objc dynamic var id: String = "1"

    override static func primaryKey() -> String? {
        return "id"
    }
    convenience init(photoLink: String, firstName: String, lastName: String, id: String) {
        self.init()
        
        self.photoLink = photoLink
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
    }
}
