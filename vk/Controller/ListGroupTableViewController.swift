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

    private lazy var groups: Results<Group> = try! Realm(configuration: RealmService.deleteIfMigration).objects(Group.self)
    
    override func viewDidLoad() {
            super.viewDidLoad()
            searchGroups.delegate = self
        
            vkService.listGroups(){ [weak self] groups in
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
    
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

}
