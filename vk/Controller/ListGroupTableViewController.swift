//
//  ListGroupTableViewController.swift
//  
//
//  Created by Ksenia on 30.10.2019.
//

import UIKit
import Kingfisher
import RealmSwift

class ListGroupTableViewController: UITableViewController, UISearchBarDelegate {

    private let vkService = VKService()
    private var notificationToken: NotificationToken?
    
    @IBOutlet weak var searchGroups: UISearchBar!
    var isSearch: Bool = false

    
    
//    let groups = [Group]()
    private lazy var groups: Results<Group> = try! Realm(configuration: RealmService.deleteIfMigration).objects(Group.self)
    

//    var newGroups:[Group] = []
//    private lazy var newGroups: Results<Group> = try! Realm(configuration: RealmService.deleteIfMigration).objects(User.self)
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if (searchText != ""){
//            isSearch = true
//            newGroups = searchGroups(groups: newGroups, str: searchText)
//        }
//        else{
//            isSearch = false
//            newGroups = groups
//        }
//        print (searchText)
//        self.tableView.reloadData()
//    }

//    func searchGroups(groups: [Group], str: String) -> [Group] {
//        var newGroups: [Group] = []
//        for group in groups {
//            if group.name.lowercased().contains(str.lowercased()){
//                newGroups.append(group)
//            }
//        }
//        return newGroups
//    }

    override func viewDidLoad() {
            super.viewDidLoad()
            searchGroups.delegate = self
//            newGroups = groups
        
            vkService.listGroups(){ [weak self] groups in
//                self?.newGroups = groups
                try? RealmService.save(items: groups, configuration: RealmService.deleteIfMigration, update: .all)
                self?.tableView.reloadData()
            }
        
            notificationToken = groups.observe { [weak self] changes in
                        guard let self = self else { return }
                        switch changes {
                        case .initial:
                            break
                        case let .update(_, deletions, insertions, modifications):
                            self.tableView.beginUpdates()
                            self.tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                            self.tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                            self.tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                            print (deletions)
                            print (insertions)
                            print (modifications)
                            self.tableView.endUpdates()
                        case .error(let error):
                            print(error)
                            break
                        }
                    }
            
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
            cell.titleLabel.text = name
            cell.photoImageView.kf.setImage(with: URL(string: groups[indexPath.row].photoLink))

            return cell
        }
    
//    @IBAction func addSelectedCity(segue: UIStoryboardSegue) {
//        if let sourceVC = segue.source as? AllGroupsTableViewController,
//            let indexPath = sourceVC.tableView.indexPathForSelectedRow {
//            let group = sourceVC.groups[indexPath.row]
//            if !newGroups.contains(where: { $0.name == group.name }) {
//                groups.append(group)
//                tableView.reloadData()
//            }
//        }
//    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // Если была нажата кнопка «Удалить»
//            if editingStyle == .delete {
//            // Удаляем город из массива
//                groups.remove(at: indexPath.row)
//            // И удаляем строку из таблицы
//                tableView.deleteRows(at: [indexPath], with: .fade)
//            }
    }

}
