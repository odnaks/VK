//
//  DownloadCircleView.swift
//  vk
//
//  Created by Ksenia on 20.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class DownloadCircleView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
    }

}
