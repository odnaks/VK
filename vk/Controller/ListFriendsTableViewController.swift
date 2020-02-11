//
//  ListFriendsTableViewController.swift
//  vk
//
//  Created by Ksenia on 29.10.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit
import RealmSwift
import Kingfisher

class ListFriendsTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchFriends: UISearchBar!
    var isSearch: Bool = false
    
    private let vkService = VKService()
    private var notificationToken: NotificationToken?
    
    
    private lazy var friends: Results<User> = try! Realm(configuration: RealmService.deleteIfMigration).objects(User.self)
    
    var sortedUser = [Character: [User]]()
    func searchFrieds(friends: [User], str: String) -> [User]{
        var newFriends: [User] = []
        
        for friend in friends {
            if (friend.firstName.lowercased().contains(str.lowercased()) ||  friend.lastName.lowercased().contains(str.lowercased()) ) {
                newFriends.append(friend)
            }
        }
        
        return newFriends
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFriends.delegate = self
        vkService.getFriends(){ [weak self] friends in
            try? RealmService.save(items: friends, configuration: RealmService.deleteIfMigration, update: .all)
            self?.sortedUser = self!.sort(users: friends)
            self?.tableView.reloadData()

        }
        notificationToken = friends.observe { [weak self] changes in
            guard let self = self else { return }
            switch changes {
            case .initial:
                break
            case let .update(_, deletions, insertions, modifications):
                self.tableView.reloadData()
                print (deletions)
                print (insertions)
                print (modifications)
            case .error(let error):
                print(error)
                break
            }
        }
        
    }

    private func sort(users: [User]) -> [Character: [User]] {
        var userDict = [Character: [User]]()
        
        users
            .sorted { $0.lastName < $1.lastName }
            .forEach { user in
            guard let firstChar = user.lastName.first else { return }
            if var thisCharUsers = userDict[firstChar] {
                thisCharUsers.append(user)
                userDict[firstChar] = thisCharUsers
            } else {
                userDict[firstChar] = [user]
            }
        }
        
        return userDict
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedUser.keys.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        vw.backgroundColor = tableView.backgroundColor!.withAlphaComponent(0.5)

        let label = UILabel(frame: CGRect(x: 5, y: 0, width: 200, height: 30))
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25)
        
        let firstChar = sortedUser.keys.sorted()[section]
        label.text = String(firstChar)
        vw.addSubview(label)
        
        
        return vw
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keysSorted = sortedUser.keys.sorted()
        return sortedUser[keysSorted[section]]?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendCell else {
            preconditionFailure("FriendCell cannot be dequeued")
        }

        let firstChar = sortedUser.keys.sorted()[indexPath.section]
        let users = sortedUser[firstChar]!
        let user: User = users[indexPath.row]
        
        cell.firstNameLabel.text = user.firstName
        cell.lastNameLabel.text = user.lastName
        cell.photoImageView.kf.setImage(with: URL(string: user.photoLink))
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhotos",
        let destinationVC = segue.destination as? FriendsPhotosViewController,
        let indexPath = tableView.indexPathForSelectedRow {
            let firstChar = sortedUser.keys.sorted()[indexPath.section]
            let users = sortedUser[firstChar]!
            let friend: User = users[indexPath.row]
        
            print ("prepare")
            destinationVC.friend = friend
        }
    }

}
