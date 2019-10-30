//
//  Group.swift
//  
//
//  Created by Ksenia on 30.10.2019.
//

import Foundation
import UIKit

class Group {
    let photo: UIImage?
    let name: String
    
    init(photo: UIImage, name: String) {
        self.photo = photo
        self.name = name
    }
    init(name: String){
        self.name = name
        self.photo = nil
    }
}
