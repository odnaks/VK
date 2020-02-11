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
    let titlePhotoLink: String
    let content: String
    let contentPhotoLink: String
    let countLikes: String
    let countComments: String
    let countReposts: String
    
    init(title: String, titlePhotoLink: String, content: String, contentPhotoLink: String,
         countLikes: String, countComments: String, countReposts: String) {
        
        self.title = title
        self.titlePhotoLink = titlePhotoLink
        self.content = content
        self.contentPhotoLink = contentPhotoLink
        self.countLikes = countLikes
        self.countComments = countComments
        self.countReposts = countReposts
    }
}

