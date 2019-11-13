//
//  ListFriendsTableViewController.swift
//  vk
//
//  Created by Ksenia on 29.10.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class ListFriendsTableViewController: UITableViewController {

    var friends = [
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova",
             photos: [
                UIImage(named: "lera1")!,
                 UIImage(named: "lera2")!,
                 UIImage(named: "lera3")!,
                 UIImage(named: "lera4")!,
                 UIImage(named: "lera5")!,
                 UIImage(named: "lera6")!,
                 UIImage(named: "lera7")!,
                 UIImage(named: "lera8")!,
                 UIImage(named: "lera9")!,
                 UIImage(named: "lera10")!
            ]
        ),
        User(photo: UIImage(named: "roma1")!, firstName: "roma", lastName: "politov",
             photos: [
                UIImage(named: "roma1")!,
                 UIImage(named: "roma2")!,
                 UIImage(named: "roma3")!,
                 UIImage(named: "roma4")!,
                 UIImage(named: "roma5")!,
                 UIImage(named: "roma6")!,
                 UIImage(named: "roma7")!,
                 UIImage(named: "roma8")!,
                 UIImage(named: "roma9")!,
                 UIImage(named: "roma10")!,
                UIImage(named: "roma11")!,
                UIImage(named: "roma12")!,
                UIImage(named: "roma13")!
            ]
        ),
        User(photo: UIImage(named: "dasha")!, firstName: "dasha", lastName: "kotava",
             photos: [
                UIImage(named: "dasha")!,
                 UIImage(named: "dasha2")!,
                 UIImage(named: "dasha3")!,
                 UIImage(named: "dasha4")!,
                 UIImage(named: "dasha5")!,
                 UIImage(named: "dasha6")!,
                 UIImage(named: "dasha7")!
            ]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            preconditionFailure("FriendCell cannot be dequeued")
        }

        let firstName = friends[indexPath.row].firstName
        let lastName = friends[indexPath.row].lastName
        let photo = friends[indexPath.row].photo
        cell.firstNameLabel.text = firstName
        cell.lastNameLabel.text = lastName
        cell.photoImageView.image = photo

        return cell
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Show Forecast",
//            let destinationVC = segue.destination as? ForecastController,
//            let indexPath = tableView.indexPathForSelectedRow {
//            let cityname = cities[indexPath.row].name
//            destinationVC.title = cityname
//        } else if segue.identifier == "Show All Cities",
//            let destinationVC = segue.destination as? AllCitiesController {
//            destinationVC.headerText = "Some text"
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhotos",
        let destinationVC = segue.destination as? PhotosCollectionViewController,
        let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.friend = friends[indexPath.row]
        }
    }

}
