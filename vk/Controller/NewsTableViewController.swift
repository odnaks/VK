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
        News(title: "свежая новость", titlePhoto: UIImage(named: "lera2")!,
             contentPhoto: UIImage(named: "lera3")!, countLikes: 39, countComments: 3),
        News(title: "старая новость", titlePhoto: UIImage(named: "lera1")!,
             contentPhoto: UIImage(named: "lera4")!, countLikes: 108, countComments: 5)
        
    ]
    
    override func viewDidLoad() {
            super.viewDidLoad()
            tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
            
        }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell

        let title = news[indexPath.row].title
        let titlePhoto = news[indexPath.row].titlePhoto
        let countLikes = news[indexPath.row].countLikes
        let countComments = news[indexPath.row].countComments
        let contentPhoto = news[indexPath.row].contentPhoto
        
        
        cell.titleLabel.text = title
        cell.titlePhotoView.image = titlePhoto
        cell.countLikesLabel.text = String(countLikes)
        cell.countCommentsLabel.text = String(countComments)
        cell.contentPhotoView.image = contentPhoto
        

        return cell
    }

}
