//
//  ListFriendsTableViewController.swift
//  vk
//
//  Created by Ksenia on 29.10.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import UIKit

class ListFriendsTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchFriends: UISearchBar!
    var isSearch: Bool = false
    
    let vkService = VKService()
    var friends = [
        User(photo: UIImage(named: "lera")!, firstName: "lera", lastName: "shevtsova",
             photos: [
                UIImage(named: "lera1")!,
                 UIImage(named: "lera2")!,
                 UIImage(named: "lera3")!,
                 UIImage(named: "lera4")!
            ]
        ),
        User(photo: UIImage(named: "roma1")!, firstName: "roma", lastName: "politov",
             photos: [
                UIImage(named: "roma3")!,
                 UIImage(named: "roma2")!
            ]
        ),
        User(photo: UIImage(named: "roma1")!, firstName: "ne_roma", lastName: "politov",
             photos: [
                UIImage(named: "roma1")!,
                 UIImage(named: "roma2")!,
                 UIImage(named: "roma3")!,
                 UIImage(named: "roma4")!
            ]
        ),
        User(photo: UIImage(named: "dasha")!, firstName: "даруа", lastName: "катава",
             photos: [
                UIImage(named: "dasha")!,
                 UIImage(named: "dasha2")!,
                 UIImage(named: "dasha3")!,
                 UIImage(named: "dasha4")!
            ]
        )
    ]
    
//    var seachedFrieds: [User] = []
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchText != ""){
            isSearch = true
            self.sortedUser = sort(users: searchFrieds(friends: friends, str: searchText))
        }
        else{
            isSearch = false
            self.sortedUser = sort(users: friends)
        }
        print (searchText)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFriends.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.sortedUser = sort(users: friends)
        
        // отправляем запрос для получения друзей
        vkService.getFriends(){ [weak self] friends in
            self?.friends = friends
            DispatchQueue.main.async {
            self?.tableView.reloadData()
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
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sortedUser.keys.count
    }

//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let firstChar = sortedUser.keys.sorted()[section]
//        return String(firstChar)
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = UIView()
        //vw.backgroundColor = UIColor.red
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
        cell.photoImageView.image = user.photo
        
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
