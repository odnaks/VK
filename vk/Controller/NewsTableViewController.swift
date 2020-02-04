//
//  NewsTableViewController.swift
//  vk
//
//  Created by Ksenia on 15.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    let news = [
        News(title: "свежая новость", titlePhoto: UIImage(named: "1")!,
             contentPhoto: UIImage(named: "1")!, countLikes: 39, countComments: 3),
        News(title: "старая новость", titlePhoto: UIImage(named: "1")!,
             contentPhoto: UIImage(named: "1")!, countLikes: 108, countComments: 5)
        
    ]
    
    override func viewDidLoad() {
            super.viewDidLoad()
//            tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
            tableView.register(UINib(nibName: "NewsCellTitle", bundle: nil), forCellReuseIdentifier: "NewsCellTitle")
            tableView.register(UINib(nibName: "NewsCellText", bundle: nil), forCellReuseIdentifier: "NewsCellText")
            tableView.register(UINib(nibName: "NewsCellImage", bundle: nil), forCellReuseIdentifier: "NewsCellImage")
            tableView.register(UINib(nibName: "NewsCellBottom", bundle: nil), forCellReuseIdentifier: "NewsCellBottom")
                
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return news.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let title = news[indexPath.section].title
        let titlePhoto = news[indexPath.section].titlePhoto
        let countLikes = news[indexPath.section].countLikes
        let countComments = news[indexPath.section].countComments
        let contentPhoto = news[indexPath.section].contentPhoto
        
        
//        cell.titleLabel.text = title
//        cell.titlePhotoView.image = titlePhoto
//        cell.countLikesLabel.text = String(countLikes)
//        cell.countCommentsLabel.text = String(countComments)
//        cell.contentPhotoView.image = contentPhoto
        
        if (indexPath.row % 4 == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellTitle", for: indexPath) as! NewsCellTitle
            cell.label.text = title
            cell.photoImageView.image = titlePhoto
            return cell
        }
        else if (indexPath.row % 4 == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellText", for: indexPath) as! NewsCellText
            cell.textView.text = "kzkzkfdsfdsff"
            return cell
        
        }
        else if (indexPath.row % 4 == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellImage", for: indexPath) as! NewsCellImage
            cell.imagePhotoView.image = titlePhoto
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellBottom", for: indexPath) as! NewsCellBottom
            cell.labelHeart.text = title
            cell.labelComment.text = title
            cell.labelRepost.text = title
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellTitle", for: indexPath) as! NewsCellTitle
        return cell
    }

}
