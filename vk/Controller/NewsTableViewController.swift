//
//  NewsTableViewController.swift
//  vk
//
//  Created by Ksenia on 15.11.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit
import Kingfisher

class NewsTableViewController: UITableViewController {

    let vkService = VKService()
//    let news = [
//        News(title: "свежая новость", titlePhoto: UIImage(named: "TitlePhoto")!, content: "hiiiiiiiiiiii",
//             contentPhoto: UIImage(named: "ContentPhoto")!, countLikes: "39", countComments: "3", countReposts: "222"),
//        News(title: "старая новость", titlePhoto: UIImage(named: "TitlePhoto")!, content: "helloy",
//             contentPhoto: UIImage(named: "ContentPhoto")!, countLikes: "108", countComments: "5", countReposts: "10")
//
//    ]
    
    var news = [News]()
    
    override func viewDidLoad() {
            super.viewDidLoad()
//            tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
            tableView.register(UINib(nibName: "NewsCellTitle", bundle: nil), forCellReuseIdentifier: "NewsCellTitle")
            tableView.register(UINib(nibName: "NewsCellText", bundle: nil), forCellReuseIdentifier: "NewsCellText")
            tableView.register(UINib(nibName: "NewsCellImage", bundle: nil), forCellReuseIdentifier: "NewsCellImage")
            tableView.register(UINib(nibName: "NewsCellBottom", bundle: nil), forCellReuseIdentifier: "NewsCellBottom")
        
         
            vkService.getNews(){ [weak self] news in
                self?.news = news
                self?.tableView.reloadData()
            }
        
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
        let titlePhotoLink = news[indexPath.section].titlePhotoLink
        let content = news[indexPath.section].content
        let contentPhotoLink = news[indexPath.section].contentPhotoLink
        
        let countLikes = news[indexPath.section].countLikes
        let countComments = news[indexPath.section].countComments
        let countReposts = news[indexPath.section].countReposts
        
        if (indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellTitle", for: indexPath) as! NewsCellTitle
            cell.label.text = title
//            cell.photoImageView.image = titlePhoto
            cell.photoImageView.kf.setImage(with: URL(string: titlePhotoLink))
            return cell
        }
        else if (indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellText", for: indexPath) as! NewsCellText
            cell.content.lineBreakMode = NSLineBreakMode.byWordWrapping
            cell.content.numberOfLines = 0
            cell.content.text = content
            return cell
        
        }
        else if (indexPath.row == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellImage", for: indexPath) as! NewsCellImage
            cell.imagePhotoView.kf.setImage(with: URL(string: contentPhotoLink))
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellBottom", for: indexPath) as! NewsCellBottom
            cell.labelHeart.text = countLikes
            cell.labelComment.text = countComments
            cell.labelRepost.text = countReposts
            return cell
        }
        
    }
}
