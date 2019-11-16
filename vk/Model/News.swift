//
//  News.swift
//  vk
//
//  Created by Ksenia on 15.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import Foundation
import UIKit

class News {
    let title: String
    let titlePhoto: UIImage?
    let contentPhoto: UIImage?
    let countLikes: Int
    let countComments: Int
    
    init(title: String, titlePhoto: UIImage, contentPhoto: UIImage,
         countLikes: Int, countComments: Int) {
        
        self.title = title
        self.titlePhoto = titlePhoto
        self.contentPhoto = contentPhoto
        self.countLikes = countLikes
        self.countComments = countComments
    }
}
