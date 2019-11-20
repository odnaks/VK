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

    var friend: User!
    
    // MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        assert(friend != nil)
        
        title = "\(friend.firstName) \(friend.lastName)"
        
        
        
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.photos!.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else { preconditionFailure() }
    
        // Configure the cell
        cell.photoImageView.image = friend.photos![indexPath.item]
    
        return cell
    }

}
