//
//  AllGroupsTableViewController.swift
//  
//
//  Created by Ksenia on 30.10.2019.
//

import UIKit
import Kingfisher

class AllGroupsTableViewController: UITableViewController, UISearchBarDelegate {

    let vkService = VKService()
    var groups = [GroupNotRealm]()
    var newGroups:[GroupNotRealm] = []
    
    @IBOutlet weak var searchGroups: UISearchBar!
    var isSearch: Bool = false
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText != ""){
            isSearch = true
        }
        else{
            isSearch = false
        }
        print (searchText)
        newGroups = searchGroups(groups: groups, str: searchText)
        
        vkService.searchGroups(str: searchText){ [weak self] groups in
            self?.groups = groups
            self?.newGroups = groups
            self?.tableView.reloadData()

        }
        self.tableView.reloadData()
    }
    

    func searchGroups(groups: [GroupNotRealm], str: String) -> [GroupNotRealm] {
        var newGroups: [GroupNotRealm] = []
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
        }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isSearch){
            return newGroups.count
        }
        else {
            return groups.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
            preconditionFailure("GroupCell cannot be dequeued")
        }

        let name: String
        let photo: String
        if (isSearch){
            name = newGroups[indexPath.row].name
            photo = newGroups[indexPath.row].photoLink
        }
        else {
            name = groups[indexPath.row].name
            photo = groups[indexPath.row].photoLink
        }
        
        cell.titleLabel.text = name
        cell.photoImageView.kf.setImage(with: URL(string: photo))

        return cell
    }

}
