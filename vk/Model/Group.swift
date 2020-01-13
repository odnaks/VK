//
//  Group.swift
//  
//
//  Created by Ksenia on 30.10.2019.
//

import Foundation
import UIKit
import RealmSwift

class Group {
    let photoLink: String
    let name: String
    
    init(photoLink: String, name: String) {
        self.photoLink = photoLink
        self.name = name
    }
    init(name: String){
        self.name = name
        self.photoLink = ""
    }
}

//class Group: Object, Decodable {
//    @objc dynamic var photoLink = "https://sun1-83.userapi.com/c836333/v836333001/31189/8To0r3d-6iQ.jpg"
//    @objc dynamic var name = "Pavel Durov"
//
//}
