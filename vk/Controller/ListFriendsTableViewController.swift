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
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova"),
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova"),
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova"),
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova"),
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova"),
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova"),
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova"),
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova"),
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova"),
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova")
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
    
//    @IBAction func addSelectedCity(segue: UIStoryboardSegue) {
//        if let sourceVC = segue.source as? AllCitiesController,
//            let indexPath = sourceVC.tableView.indexPathForSelectedRow {
//            let city = sourceVC.cities[indexPath.row]
//            if !cities.contains(where: { $0.name == city.name }) {
//                cities.append(city)
//                tableView.reloadData()
//            }
//        }
//    }

}
