//
//  Session.swift
//  vk
//
//  Created by Ksenia on 07.12.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init(){}
    
    var token: String = ""
    var userId: String = ""
    
}
