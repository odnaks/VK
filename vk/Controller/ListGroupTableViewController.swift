//
//  ListGroupTableViewController.swift
//  
//
//  Created by Ksenia on 30.10.2019.
//

import UIKit

class ListGroupTableViewController: UITableViewController, UISearchBarDelegate {

    let vkService = VKService()
    
    @IBOutlet weak var searchGroups: UISearchBar!
    var isSearch: Bool = false

    
    let groups = [
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page"),
        Group(photo: UIImage(named: "sunset")!, name: "super public page")
    ]

    var newGroups:[Group] = []
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText != ""){
            isSearch = true
            newGroups = searchGroups(groups: newGroups, str: searchText)
        }
        else{
            isSearch = false
            newGroups = groups
        }
        print (searchText)
        self.tableView.reloadData()
    }

    func searchGroups(groups: [Group], str: String) -> [Group] {
        var newGroups: [Group] = []
        for group in groups {
            if group.name.lowercased().contains(str.lowercased()){
                newGroups.append(group)
            }
        }
        return newGroups
    }

    override func viewDidLoad() {
            super.viewDidLoad()
            searchGroups.delegate = self
            newGroups = groups
        
            vkService.listGroups()
        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return newGroups.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
                preconditionFailure("GroupCell cannot be dequeued")
            }

            let name = newGroups[indexPath.row].name
            let photo = newGroups[indexPath.row].photo
            cell.titleLabel.text = name
            cell.photoImageView.image = photo

            return cell
        }
    
    @IBAction func addSelectedCity(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? AllGroupsTableViewController,
            let indexPath = sourceVC.tableView.indexPathForSelectedRow {
            let group = sourceVC.groups[indexPath.row]
            if !newGroups.contains(where: { $0.name == group.name }) {
                newGroups.append(group)
                tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // Если была нажата кнопка «Удалить»
            if editingStyle == .delete {
            // Удаляем город из массива
                newGroups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
    }

}
