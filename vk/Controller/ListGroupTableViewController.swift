//
//  ListGroupTableViewController.swift
//  
//
//  Created by Ksenia on 30.10.2019.
//

import UIKit

class ListGroupTableViewController: UITableViewController {

    var groups = [
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page")
    ]
    
    override func viewDidLoad() {
            super.viewDidLoad()
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
    
    @IBAction func addSelectedCity(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? AllGroupsTableViewController,
            let indexPath = sourceVC.tableView.indexPathForSelectedRow {
            let group = sourceVC.groups[indexPath.row]
            if !groups.contains(where: { $0.name == group.name }) {
                groups.append(group)
                tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // Если была нажата кнопка «Удалить»
            if editingStyle == .delete {
            // Удаляем город из массива
                groups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
    }

}
