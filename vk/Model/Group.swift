//
//  Group.swift
//  
//
//  Created by Ksenia on 30.10.2019.
//

import Foundation
import UIKit

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
