//
//  DownloadView.swift
//  vk
//
//  Created by Ksenia on 18.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class DownloadView: UIView {

    @IBOutlet var oneLoad: UIView!
    @IBOutlet var twoLoad: UIView!
    @IBOutlet var threeLoad: UIView!
    
//    override func viewDidAppear(_ animated: Bool) {
//            super.viewDidAppear(animated)
//    }
    
    
    func animate_rev(){
        UIView.animate(withDuration: 0.8, delay: 0, animations: {
            self.oneLoad.alpha = 1
        }, completion:
            { _ in
                UIView.animate(withDuration: 0.8, delay: 0, animations: {
                    self.twoLoad.alpha = 1
                }, completion:
                    {
                        _ in
                        UIView.animate(withDuration: 0.8, delay: 0, animations: {
                            self.threeLoad.alpha = 1
                        }, completion: { _ in
                            self.animate() })
                })
        })
    }
    
    func animate(){
        UIView.animate(withDuration: 0.8, delay: 0, animations: {
            self.oneLoad.alpha = 0
        }, completion:
            { _ in
                UIView.animate(withDuration: 0.8, delay: 0, animations: {
                    self.twoLoad.alpha = 0
                }, completion:
                    {
                        _ in
                        UIView.animate(withDuration: 0.8, delay: 0, animations: {
                            self.threeLoad.alpha = 0
                        }, completion: { _ in
                            
                            self.animate_rev()
                            
                        })
                })
        })
    }
    
    @IBAction func anim(_ sender: Any) {
        animate()
    }
  
    
    
    
}
