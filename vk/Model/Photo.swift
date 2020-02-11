//
//  Photo.swift
//  vk
//
//  Created by Ksenia on 16.01.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Photo: Object {
    @objc dynamic var id: String = "1"
    @objc dynamic var ownerId: String = "1"
    @objc dynamic var photoUrl: String = "https://sun1-83.userapi.com/c836333/v836333001/31189/8To0r3d-6iQ.jpg"
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(id: String, photoUrl: String, ownerId: String) {
        self.init()
        
        self.photoUrl = photoUrl
        self.id = id
        self.ownerId = ownerId
    }
}
