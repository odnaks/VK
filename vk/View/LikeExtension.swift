//
//  likeExtension.swift
//  vk
//
//  Created by Ksenia on 08.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

extension UIBezierPath {
    convenience init(heartIn rect: CGRect) {
        self.init()
    }
}
extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}
