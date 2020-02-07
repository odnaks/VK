//
//  GroupNotRealm.swift
//  vk
//
//  Created by Ksenia on 05.02.2020.
//  Copyright © 2020 Ksenia. All rights reserved.
//

import Foundation

class GroupNotRealm {
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
