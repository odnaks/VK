//
//  PhotosCollectionViewController.swift
//  vk
//
//  Created by Ksenia on 30.10.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

//    var likeControl: LikeControl = LikeControl()
    
    private let photos = [
        UIImage(named: "lera1"),
        UIImage(named: "lera2"),
        UIImage(named: "lera3"),
        UIImage(named: "lera4"),
        UIImage(named: "lera5"),
        UIImage(named: "lera6"),
        UIImage(named: "lera7"),
        UIImage(named: "lera8"),
        UIImage(named: "lera9"),
        UIImage(named: "lera10")
    ]

//    @objc func likedChanged(){
//       print("like")
//    }
    
    // MARK: UICollectionViewDataSource

    override func viewDidLoad() {
        super.viewDidLoad()
    
//        likeControl.addTarget(self, action: #selector(likedChanged), for: .valueChanged)
        
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else { preconditionFailure() }
    
        // Configure the cell
        cell.photoImageView.image = photos[indexPath.item]
    
        return cell
    }

}
