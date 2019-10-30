//
//  AllGroupsTableViewController.swift
//  
//
//  Created by Ksenia on 30.10.2019.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    var groups = [
        Group(photo: UIImage(named: "white")!, name: "white public page"),
        Group(photo: UIImage(named: "yellow")!, name: "yellow public page"),
        Group(photo: UIImage(named: "blue")!, name: "blue public page"),
        Group(photo: UIImage(named: "dark")!, name: "dark public page"),
        Group(photo: UIImage(named: "grey")!, name: "grey public page")
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
            return groups.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
                preconditionFailure("GroupCell cannot be dequeued")
            }

            let name = groups[indexPath.row].name
            let photo = groups[indexPath.row].photo
            cell.titleLabel.text = name
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
